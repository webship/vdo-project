#!/bin/usr/env bash

# Install Webship with Drush.
function install_webship_with_drush() {
  echo "Install Webship with Drush.";
  ../vendor/drush/drush/drush site-install webship --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" ;
  ../vendor/drush/drush/drush config:set system.performance css.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.performance js.preprocess 0 --yes ;
  ../vendor/drush/drush/drush config:set system.logging error_level all --yes ;
  ../vendor/drush/drush/drush cache:rebuild ;
}

# Enable Webship extra components.
function enable_webship_extra_components() {
  echo "Enable Webship extra components.";
}