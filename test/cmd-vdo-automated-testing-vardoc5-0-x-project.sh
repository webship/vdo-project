#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Set site version.
site_version="5.0.x-dev";

ARGPARSE_DESCRIPTION="Add new Vardoc 4.0.x-dev ready Automated testing builds, and install. Then run tests using a real browser or headless browser"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('TESTING_PATH',
                    default='tests/features/vardoc',
                    nargs='?',
                    help='Testing path. default value [ tests/features/vardoc ]')
parser.add_argument('-r', '--run',
                    action='store_true',
                    default=False,
                    help='Run the automate test with real browser. Shows the work of the driver on the browser.')
parser.add_argument('-b', '--run-no-headless',
                    action='store_true',
                    default=False,
                    help='Run a real no headless browser automate test. An alies for --run')
parser.add_argument('-l', '--run-headless',
                    action='store_true',
                    default=False,
                    help='Run a headless automate test. Hides the work of the driver on the browser.')
parser.add_argument('-n', '--no-headless',
                    action='store_true',
                    default=False,
                    help='Configure the test as a real browser with no headless automate test.')
parser.add_argument('-s', '--headless',
                    action='store_true',
                    default=False,
                    help='Configure the test as a headless automate test.')
EOF


# Help link:
# Add new vardoc ready Automated testing builds, install,
# then run tests using open browser or headless #50
# ---------------------------------------------------
# https://github.com/webship/vdo-project/issues/50
# ---------------------------------------------------

# Default values.
run_automated_testing=false;
headless=true;

if [ "$RUN" == 'yes' ]; then
  run_automated_testing=true;
  headless=false;
fi

if [ "$RUN_NO_HEADLESS" == 'yes' ]; then
  run_automated_testing=true;
  headless=false;
fi

if [ "$RUN_HEADLESS" == 'yes' ]; then
  run_automated_testing=true;
  headless=true;
fi

if [ "$HEADLESS" == 'yes' ]; then
  headless=true;
fi

if [ "$NO_HEADLESS" == 'yes' ]; then
  headless=false;
fi

shift $#;

base_url="http://${vdo_host}/${doc_name}/${PROJECT_NAME}/docroot";


# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${PROJECT_NAME}" ]; then
  sudo rm -rf ${PROJECT_NAME} 
fi

full_database_name="${database_prefix}${PROJECT_NAME}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -vvv

composer create-project vardot/vardoc-project:${site_version} ${PROJECT_NAME} --no-interaction  ;

cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
composer require --dev drupal/core-dev:~9.0 --with-all-dependencies;
composer require --dev drush/drush:~11.0 --with-all-dependencies;
composer require --dev drupal/drupal-extension:~4.0 --with-all-dependencies ;
composer require --dev emuse/behat-html-formatter:^0.2.0 --with-all-dependencies;
composer require --dev drevops/behat-screenshot:~1.0 --with-all-dependencies;

cp ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/default.settings.php ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;
echo "\$databases['default']['default'] = [
  'database' => '${full_database_name}',
  'username' => '${database_username}',
  'password' => '${database_password}',
  'host' => '${database_host}',
  'port' => '${database_port}',
  'namespace' => '${database_namespace}',
  'driver' => '${database_driver}',
  'prefix' => '',
  'collation' => '${database_collation}',
];" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

mkdir -p ${vdo_root}/${doc_name}/${PROJECT_NAME}/config/sync ;
echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

sed -i "s,127.0.0.1:4445/wd/hub,${automated_testing_wd_host},g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/vardoc/behat.yml ;
sed -i "s,http://vardoc.test,${base_url},g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/vardoc/behat.yml ;

webmaster_testing_user_target="webmaster: { email: '${account_mail}', password: '${account_pass}' }" ;

sed -i "s/webmaster: { email: 'webmaster@vardot.com', password: 'dD.123123ddd' }/${webmaster_testing_user_target}/g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/vardoc/behat.yml ;

if ! $headless ; then
  sed -i "s,- \"--headless\",#- \"--headless\",g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/vardoc/behat.yml ;
fi

sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

# Change directory to the docroot.
cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot;

# Install vardoc with Drush.
../bin/drush site:install vardoc --yes --site-name="${doc_name} ${PROJECT_NAME}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}:${database_port}/${full_database_name}" --locale="en"  vardoc_extra_components.vardoc_demo=true -vvv;
../bin/drush pm:enable varbase_development --yes ;
../bin/drush config:set system.performance css.preprocess 0 --yes ;
../bin/drush config:set system.performance js.preprocess 0 --yes ;
../bin/drush config:set system.logging error_level all --yes ;


## Uninstall Antibot module to let the selenium bot work  
../bin/drush pm:uninstall antibot --yes

## Rebuild the cache.
../bin/drush cache:rebuild ;

# Add testing users.
cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/vardoc/scripts
bash add-testing-users.sh

# Send a notification.
echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
echo "-----------------------------------------";
echo " Change direcotry to the project:"
echo " cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/vardoc";
echo "-----------------------------------------";
echo " To run the full test with one command:";
echo " ../../../bin/behat tests/features/vardoc"
echo "-----------------------------------------";
echo " To run tests in Automated Functional Acceptance Testing group";
echo " ../../../bin/behat tests/features/vardoc/01-website-base-requirements/";
echo " ../../../bin/behat tests/features/vardoc/02-user-management/";
echo " ../../../bin/behat tests/features/vardoc/03-admin-management/";
echo " ../../../bin/behat tests/features/vardoc/04-content-structure/";
echo " ../../../bin/behat tests/features/vardoc/05-content-management/";
echo "-----------------------------------------";
echo " To run only one feature ";
echo " ../../../bin/behat tests/features/vardoc/01-website-base-requirements/01-01-user-registration_only-admins-login.feature"
echo "-----------------------------------------";
cd ${vdo_root}/${doc_name};

## Run the full automated test.
if $run_automated_testing ; then
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/vardoc;
  ../../../bin/behat ${TESTING_PATH} ;
fi