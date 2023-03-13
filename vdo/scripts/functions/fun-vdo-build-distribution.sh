#!/bin/usr/env bash

function build_distribution() {
  # Include distribution functions.
  source ${vdo_scripts}/functions/fun-vdo-distribution-${distribution_name}.sh || exit 1 ;

  base_url="${vdo_protocol}://${vdo_host}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}";

  # Change directory to the workspace for this full operation.
  cd ${vdo_root}/${doc_name};

  if [ -d "${PROJECT_NAME}" ]; then
    sudo rm -rf ${PROJECT_NAME} 
  fi

  full_database_name="${database_prefix}${PROJECT_NAME}";
  if [ ! "${SKIP_DROP_DATABASE}" == 'yes' ] ; then
    drop_database;
  fi

  composer create-project ${distribution_project_template}:${site_version} ${PROJECT_NAME} --no-interaction  ;

  # Go into the project folder.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

  # Change the minimum stablility to dev for development on VDO
  composer config minimum-stability dev ;

  # Require all custom required packages.
  echo "Require all custom required packages.";
  if [ "${REQUIRE}" == '_none_' ] ; then
    echo "No extra composer required." ;
  else
    composer require ${REQUIRE} ;
  fi

  # Add Gleap 
  if [ "$GLEAP" == 'yes' ] ; then
    add_gleap ;
  fi

  ## Add default settings file before starting the install.
  if [ ! "$SKIP_SET_DEFULT_SETTINGS" == 'yes' ] ; then
    set_default_settings ;
  fi

  # Securing file permissions and ownership.
  set_chmod_chown ;

  ## Install the site.
  if [ "$INSTALL" == 'yes' ] ; then
    echo "Install the site";

    # Add Drush if it was not in the system.
    add_drush ;

    # Change directory to the webroot.
    cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot};

    # Install distribution with Drush.
    install_${distribution_name}_with_drush ;
    # Enable extra components;
    enable_${distribution_name}_extra_components ;
    # Set Aggrigation off and error level all
    drush_set_debug_on;
    # Cache Rebuilding ...
    drush_cr;

    if [ "${ENABLE}" == '_none_' ] ; then
      echo "No extra selected modules to enlable." ;
    else
      ../vendor/drush/drush/drush pm:enable ${ENABLE} --yes;
    fi

    ## Add default set of users.
    if [ "$ADD_USERS" == 'yes' ] ; then
    add_users ;
    fi

    # Send a notification.
    echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";
    echo "Go to ${base_url}";

  else 
    echo "${doc_name} ${PROJECT_NAME} is ready to install!!!!";
    echo "Go to ${base_url}";
  fi

  cd ${vdo_root}/${doc_name};
}