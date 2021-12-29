#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Change with the version of Varbase ~9.0.0
site_version="~9.0.0";

ARGPARSE_DESCRIPTION="Build a Varbase ${site_version} project"
source ${vdo_scripts}/args/arg-vdo-varbase.sh || exit 1 ;

shift $#;

base_url="http://${vdo_host}/${doc_name}/${PROJECT_NAME}/docroot";

# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${PROJECT_NAME}" ]; then
  sudo rm -rf ${PROJECT_NAME} 
fi

full_database_name="${database_prefix}${PROJECT_NAME}";
if [ ! "${SKIP_DROP_DATABASE}" == 'yes' ] ; then
  drop_database;
fi

composer create-project vardot/varbase-project:${site_version} ${PROJECT_NAME} --no-interaction  ;

# Go into the project folder.
cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

if [ "${REQUIRE}" == '_none_' ] ; then
  echo "No extra composer required." ;
else
  composer require ${REQUIRE} ;
fi

## Add default settings file before starting the install.
if [ ! "$SKIP_SET_DEFULT_SETTINGS" == 'yes' ] ; then
  set_default_settings ;
fi

sudo chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
sudo chown www-data:${user_name} -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

echo "${doc_name} ${PROJECT_NAME} is ready to install!!!!";
echo "Go to ${base_url}";

## Install the site.
if [ "$INSTALL" == 'yes' ] ; then

  if [ ! -d "${vdo_root}/${doc_name}/${PROJECT_NAME}/vendor/drush/drush" ]; then
    cd ${vdo_root}/${doc_name}/${PROJECT_NAME};
    composer require drush/drush:~10;
  fi

  # Change directory to the docroot.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot;

  # Install Varbase with Drush.
  ../bin/drush site:install varbase --yes --site-name="${doc_name} ${PROJECT_NAME}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}:${database_port}/${full_database_name}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider_media=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL -vvv;
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

  if [ "${ENABLE}" == '_none_' ] ; then
    echo "No extra selected modules to enlable." ;
  else
    ../vendor/drush/drush/drush pm:enable ${ENABLE} --yes;
  fi

  ## Add default set of users.
  if [ "$ADD_USERS" == 'yes' ] ; then
    
    USER_LIST_NAME="varbase";
    add_users ${PROJECT_NAME} ${USER_LIST_NAME};
  fi

  # Send a notification.
  echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
  echo "Go to ${base_url}";
  cd ${vdo_root}/${doc_name};
fi
