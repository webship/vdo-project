#!/bin/usr/env bash

# Install Vardoc with Drush.
function install_vardoc_with_drush() {
  drush site-install vardoc --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --db-url="mysql://${database_username}:${database_password}@${database_host}/${full_database_name}" varbase_development_tools.varbase_development=1 -vvv;
}

# Enable Vardoc extra components.
function enable_vardoc_extra_components() {
  echo "Enable Vardoc extra components.";
}