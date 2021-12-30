#!/bin/usr/env bash

# Install Uber Publisher with Drush.
function install_uber_publisher_with_drush() {
  drush site-install uber_publisher --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" varbase_development_tools.varbase_development=1 -vvv;
}

# Enable Uber Publisher extra components.
function enable_uber_publisher_extra_components() {
  echo "Enable Uber Publisher extra components.";
}