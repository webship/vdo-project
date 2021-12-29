#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.demos.settings.yml);

# Change with the version of Varbase 8.8.x-dev
site_version="^8.8.0";


ARGPARSE_DESCRIPTION="Build a Varbase ~8.0 project"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('-i', '--install',
                    action='store_true',
                    default=False,
                    help='Add the install flag to install the project.')
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

base_url="http://${vdo_host}/${doc_name}/${PROJECT_NAME}/docroot";

# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${PROJECT_NAME}" ]; then
  sudo rm -rf ${PROJECT_NAME} 
fi

full_database_name="${database_prefix}${PROJECT_NAME}";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" -vvv

composer create-project vardot/varbase-project:${site_version} ${PROJECT_NAME} --no-interaction  ;

# Go into the project folder.
cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

if [ "${REQUIRE}" == '_none_' ] ; then
  echo "No extra composer required." ;
else
  composer require ${REQUIRE} ;
fi

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

# Create the config/sync folder.
mkdir -p ${vdo_root}/${doc_name}/${PROJECT_NAME}/config/sync ;
echo "\$settings['config_sync_directory'] = '${config_sync_directory}';" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php ;

sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME}
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME}

echo "${doc_name} ${PROJECT_NAME} is ready to install!!!!";
echo "Go to ${base_url}";

if [ "$INSTALL" == 'yes' ] ; then
  # Change directory to the docroot.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot;

  # Install Varbase with Drush.
  drush site-install varbase --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider_media=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true varbase_development_tools.varbase_development=true -vvv;
  drush pm-enable varbase_styleguide --yes ;
  drush pm-enable vbp_text_and_image --yes ;
  drush pm-enable varbase_media_instagram --yes ;
  drush pm-enable varbase_media_twitter --yes ;
  drush pm-enable social_auth_google --yes ;
  drush pm-enable social_auth_facebook --yes ;
  drush pm-enable social_auth_twitter --yes ;
  drush pm-enable social_auth_linkedin --yes ;
  drush config-set system.performance css.preprocess 0 --yes ;
  drush config-set system.performance js.preprocess 0 --yes ;
  drush config-set system.logging error_level all --yes ;
  drush cr ;

  if [ "${ENABLE}" == '_none_' ] ; then
    echo "No extra selected modules to enlable." ;
  else
    ../vendor/drush/drush/drush pm:enable ${ENABLE} --yes;
  fi

  # Send a notification.
  echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
  echo  "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
  sudo chmod 775 -R ${PROJECT_NAME};
  sudo chown www-data:${user_name} -R ${PROJECT_NAME};
fi
