#!/bin/usr/env bash

# Install VDO with Drush.
function install_vdo_with_drush() {
  echo "Install VDO with Drush.";
  ../vendor/drush/drush/drush site-install vdo --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" ;
  ../vendor/drush/drush/drush config:set system.performance css.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.performance js.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.logging error_level all --yes ;
  ../vendor/drush/drush/drush cache:rebuild ;
}

# Enable VDO extra components.
function enable_vdo_extra_components() {
  echo "Enable VDO extra components.";
}