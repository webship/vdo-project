#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Change with the version of Varbase 9.1.x-dev, 9.1.0
site_version="^9.1.0";
# Change with the version of Varbase 91DEV
site_version_code="910DEV";


ARGPARSE_DESCRIPTION="Add new Varbase ~9.0.0 ready Automated testing builds, and install. Then run tests using a real browser or headless browser"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('TESTING_PATH',
                    default='tests/features/varbase',
                    nargs='?',
                    help='Testing path. default value [ tests/features/varbase ]')
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

shift $#;

base_url="http://${vdo_host}/${doc_name}/${PROJECT_NAME}/docroot";


# Help link:
# Add new Varbase ready Automated testing builds, install,
# then run tests using open browser or headless #50
# ---------------------------------------------------
# https://github.com/webship/vdo-project/issues/50
# ---------------------------------------------------

# Default values.
run_automated_testing=false;
headless=true;

if [ ${RUN} == 'yes' ]; then
  run_automated_testing=true;
  headless=false;
fi

if [ ${RUN_NO_HEADLESS} == 'yes' ]; then
  run_automated_testing=true;
  headless=false;
fi

if [ ${RUN_HEADLESS} == 'yes' ]; then
  run_automated_testing=true;
  headless=true;
fi

if [ ${HEADLESS} == 'yes' ]; then
  headless=true;
fi

if [ ${NO_HEADLESS} == 'yes' ]; then
  headless=false;
fi

shift $#;


# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${PROJECT_NAME}" ]; then
  sudo rm -rf ${PROJECT_NAME} -vvv
fi

full_database_name="${database_prefix}${PROJECT_NAME}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -vvv

composer create-project vardot/varbase-project:${site_version} ${PROJECT_NAME} --no-interaction -vvv ;

cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
composer require --dev drupal/core-dev:~9.0 ;
composer require --dev drush/drush:~10;
composer require --dev drupal/drupal-extension:~4.0 ;
composer require --dev emuse/behat-html-formatter:^0.2.0 ;

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

sed -i "s,127.0.0.1:4445/wd/hub,${automated_testing_wd_host},g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/varbase/behat.varbase.yml ;
sed -i "s,http://varbase.test,${base_url},g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/varbase/behat.varbase.yml ;

webmaster_testing_user_target="webmaster: { email: '${account_mail}', password: '${account_pass}' }" ;

sed -i "s/webmaster: { email: 'webmaster@vardot.com', password: 'dD.123123ddd' }/${webmaster_testing_user_target}/g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/varbase/behat.varbase.yml ;

if ! $headless ; then
  sed -i "s,- \"--headless\",#- \"--headless\",g" ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/varbase/behat.varbase.yml ;
fi

sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

# Change directory to the docroot.
cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot;

# Install Varbase with Drush.
../bin/drush site:install varbase --yes --site-name="${doc_name} ${PROJECT_NAME}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}:${database_port}/${full_database_name}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider_media=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL -vvv;
../bin/drush pm:enable varbase_development --yes ;
../bin/drush pm:enable varbase_styleguide --yes ;
../bin/drush pm:enable varbase_landing --yes
../bin/drush pm:enable varbase_api --yes ;
../bin/drush pm:enable varbase_content_planner --yes ;
../bin/drush pm:enable varbase_media_instagram --yes ;
../bin/drush pm:enable varbase_media_twitter --yes ;
../bin/drush pm:enable social_auth_facebook --yes ;
../bin/drush pm:enable social_auth_twitter --yes ;
../bin/drush pm:enable social_auth_linkedin --yes ;
../bin/drush config:set system.performance css.preprocess 0 --yes ;
../bin/drush config:set system.performance js.preprocess 0 --yes ;
../bin/drush config:set system.logging error_level all --yes ;
../bin/drush cache:rebuild ;

# Send a notification.
echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
echo "-----------------------------------------";
echo " Change direcotry to the project:"
echo " cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/varbase";
echo "-----------------------------------------";
echo " To run the full test with one command:";
echo " ../../../bin/behat tests/features/varbase"
echo "-----------------------------------------";
echo " To run tests in steps";
echo " ../../../bin/behat tests/features/varbase/step1-init-tests";
echo " ../../../bin/behat tests/features/varbase/step2-apply-tests";
echo " ../../../bin/behat tests/features/varbase/step3-cleanup-tests";
echo "-----------------------------------------";
echo " To run only one feature ";
echo " ../../../bin/behat tests/features/varbase/step2-apply-tests/01-website-base-requirements/01-01-user-registration_only-admins-login.feature"
echo "-----------------------------------------";
cd ${vdo_root}/${doc_name};

## Run the full automated test.
if $run_automated_testing ; then
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/profiles/varbase;
  ../../../bin/behat ${TESTING_PATH} ;
fi
