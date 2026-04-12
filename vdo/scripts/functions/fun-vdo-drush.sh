#!/bin/usr/env bash

# Add Drush if it was not in the system.
function add_drush() {
  echo "Add Drush if it was not in the system.";
  if [ ! -d "${vdo_root}/${doc_name}/${PROJECT_NAME}/vendor/drush/drush" ]; then
    cd ${vdo_root}/${doc_name}/${PROJECT_NAME};
    ddev composer require "drush/drush:~11 || ~13";
  fi
}

# Cache Rebuilding ...
function drush_cr() {
  echo "Cache Rebuilding ..."
  ddev drush cache:rebuild ;
}

# Set Aggrigation off and error level all
function drush_set_debug_on() {
  echo "Set Aggrigation off and error_level on";
  ddev drush config:set system.performance css.preprocess 0 --yes ;
  ddev drush config:set system.performance js.preprocess 0 --yes ;
  ddev drush config:set system.logging error_level all --yes ;
}

# Set Aggrigation ON and error level OFF
function drush_set_debug_off() {
  echo "Set Aggrigation ON and error_level OFF";
  ddev drush config:set system.performance css.preprocess 1 --yes ;
  ddev drush config:set system.performance js.preprocess 1 --yes ;
  ddev drush config:set system.logging error_level 0 --yes ;
}
