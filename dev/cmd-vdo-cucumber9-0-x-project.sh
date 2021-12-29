#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

# Change with the version.
site_version="9.0.x-dev";

ARGPARSE_DESCRIPTION="Build a Cucumber ${site_version} project"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('-i', '--install',
                    action='store_true',
                    default=False,
                    help='Add the install flag to install the project.')
parser.add_argument('-a', '--add-users',
                    action='store_true',
                    default=False,
                    help='Add default set of users to the project in the case of install')
parser.add_argument('-r', '--require',
                    default="_none_",
                    nargs='+',
                    help='Require more modules/themes/libraries by composer. Example: --require "drupal/ctools:~3.0 drupal/token:~1.0"')
parser.add_argument('-e', '--enable',
                    default="_none_",
                    nargs='+',
                    help='Enable modules right after the install. Example: --enable "media media_library ctools token"')
EOF

shift $#;

base_url="http://${vdo_host}/${doc_name}/${PROJECT_NAME}/web";

# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${PROJECT_NAME}" ]; then
  sudo rm -rf ${PROJECT_NAME} 
fi

full_database_name="${database_prefix}${PROJECT_NAME}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -vvv

composer create-project webship/cucumber-project:${site_version} ${PROJECT_NAME} --no-interaction  ;

# Go into the project folder.
cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

if [ "${REQUIRE}" == '_none_' ] ; then
  echo "No extra composer required." ;
else
  composer require ${REQUIRE} ;
fi

cp ${vdo_root}/${doc_name}/${PROJECT_NAME}/web/sites/default/default.settings.php ${vdo_root}/${doc_name}/${PROJECT_NAME}/web/sites/default/settings.php ;
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
];" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/web/sites/default/settings.php ;

# Create the config/sync folder.
mkdir -p ${vdo_root}/${doc_name}/${PROJECT_NAME}/config/sync ;
echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/web/sites/default/settings.php ;

sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME}
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME}

echo "${doc_name} ${PROJECT_NAME} is ready to install!!!!";
base_url="http://${vdo_host}/${doc_name}/${PROJECT_NAME}/web";
echo "Go to ${base_url}";

if [ "$INSTALL" == 'yes' ] ; then

  if [ ! -d "${vdo_root}/${doc_name}/${PROJECT_NAME}/vendor/drush/drush" ]; then
    cd ${vdo_root}/${doc_name}/${PROJECT_NAME};
    composer require drush/drush:~10;
  fi

  # Change directory to web.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/web/;

  # Install Cucumber with Drush.
  ../vendor/drush/drush/drush site-install cucumber --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" ;
  ../vendor/drush/drush/drush config:set system.performance css.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.performance js.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.logging error_level all --yes ;
  ../vendor/drush/drush/drush cache:rebuild ;

  if [ "${ENABLE}" == '_none_' ] ; then
    echo "No extra selected modules to enlable." ;
  else
    ../vendor/drush/drush/drush pm:enable ${ENABLE} --yes;
  fi

  sudo chmod 775 -R ${PROJECT_NAME};
  sudo chown www-data:${user_name} -R ${PROJECT_NAME};


  ## Add default set of users.
  if [ "$ADD_USERS" == 'yes' ] ; then
    
    USER_LIST_NAME="cucumber";
    add_users ${PROJECT_NAME} ${USER_LIST_NAME};
  fi


  # Send a notification.
  echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
  echo  "Go to ${base_url}";

  cd ${vdo_root}/${doc_name};
fi