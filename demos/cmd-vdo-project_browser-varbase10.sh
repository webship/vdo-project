#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.demos.settings.yml);

echo "*----------------------------------------------------------------------*";
echo "|  Build Project Browser module under Varbase 10.0.x-dev                |";
echo "*----------------------------------------------------------------------*";


# Set site version.
site_version="10.0.x-dev";

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

composer require drupal/project_browser:1.0.x-dev ;

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

sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

echo "${doc_name} ${PROJECT_NAME} is ready to install!!!!";
echo "Go to ${base_url}";

## Install the site.
if [ "$INSTALL" == 'yes' ] ; then

  # Add Drush if it was not in the system.
  add_drush ;

  # Change directory to the docroot.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot;

  # Install Varbase with Drush.
  ../bin/drush site:install varbase --yes --site-name="${doc_name} ${PROJECT_NAME}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}:${database_port}/${full_database_name}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL -vvv;
  ../bin/drush pm:enable varbase_development --yes ;
  ../bin/drush pm:enable varbase_styleguide --yes ;
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
  ../bin/drush pm:enable project_browser --debug --yes ;
  ../bin/drush cache:rebuild ;

  if [ "${ENABLE}" == '_none_' ] ; then
    echo "No extra selected modules to enlable." ;
  else
    ../vendor/drush/drush/drush pm:enable ${ENABLE} --yes;
  fi

  ## Add default set of users.
  if [ "$ADD_USERS" == 'yes' ] ; then

    # Load the list of default users for Varbase.
    eval $(parse_yaml ${vdo_config}/users/varbase.users.yml);

    cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/;

    for user in ${users[@]}
    do
        user_name="user_${user}_name";
        user_mail="user_${user}_mail";
        user_password="user_${user}_password";
        user_role="user_${user}_role";

        echo " ---------------------------------------------------------------- ";
        echo "      User name: ${!user_name}";
        echo "      User mail: ${!user_mail}";
        echo "  User password: ${!user_password}";
        echo "      User role: ${!user_role}";
        echo " ================================================================= ";

        ../bin/drush user:create "${!user_name}" --mail="${!user_mail}" --password="${!user_password}" ;
      if [ ! -z "${!user_role}" ]; then
        ../bin/drush user:role:add "${!user_role}" "${!user_name}" ;
      fi
    done

    echo "Start Cache rebuilding ...";
    ../bin/drush cache:rebuild ;

  fi

  # Send a notification.
  echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
  echo "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
fi
