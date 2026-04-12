#!/bin/usr/env bash

function build_distribution() {
  # Include distribution functions.
  source ${vdo_scripts}/functions/fun-vdo-distribution-${distribution_name}.sh || exit 1 ;

  # Change directory to the workspace for this full operation.
  cd ${vdo_root}/${doc_name};

  if [ -d "${PROJECT_NAME}" ]; then
    rm -rf ${PROJECT_NAME}
  fi

  mkdir ${PROJECT_NAME} ;
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

  ddev config --project-type=drupal --docroot=${distribution_webroot} --php-version=8.4 ;
  ddev start ;

  # Enable Corepack for yarn modern.
  ddev exec corepack enable ;

  ddev composer create-project ${distribution_project_template}:${site_version} ${vdo_root}/${doc_name}/${PROJECT_NAME} --no-interaction -vvv;

  # Go into the project folder.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

  # Change the minimum stablility to dev for development on VDO
  ddev composer config minimum-stability dev ;

  # Require all custom required packages.
  echo "Require all custom required packages.";
  if [ "${REQUIRE}" == '_none_' ] ; then
    echo "No extra composer required." ;
  else
    ddev composer require ${REQUIRE} ;
  fi

  # Add Gleap
  if [ "$GLEAP" == 'yes' ] ; then
    add_gleap ;
  fi

  ## Add default settings file before starting the install.
  if [ ! "$SKIP_SET_DEFULT_SETTINGS" == 'yes' ] ; then
    set_default_settings ;
  fi

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
      ddev drush pm:enable ${ENABLE} --yes;
    fi

    ## Add default set of users.
    if [ "$ADD_USERS" == 'yes' ] ; then
    add_users ;
    fi

    # Send a notification.
    echo "${doc_name} ${PROJECT_NAME} has been installed!!!!";

  else
    echo "${doc_name} ${PROJECT_NAME} is ready to install!!!!";
  fi

  cd ${vdo_root}/${doc_name};
}