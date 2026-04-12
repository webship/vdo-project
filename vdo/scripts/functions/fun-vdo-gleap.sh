#!/bin/usr/env bash

# Add Gleap.
function add_gleap() {
  echo "Add Gleap";
  mkdir -p ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/modules/custom ;
  cp -r ${vdo_assets}/drupal/modules/varbase_gleap ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/modules/custom/
}

# Enable Gleap.
function enable_gleap() {
  # Change directory to the project.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot} ; 

  echo "Enable Gleap";
  ddev drush pm:enable varbase_gleap
}

# Disable Gleap.
function disable_gleap() {
  # Change directory to the project.
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot} ;

  echo "Disable Gleap";
  ddev drush pm:uninstall varbase_gleap
}
