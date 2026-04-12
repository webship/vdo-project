#!/bin/usr/env bash

# Install Cucumber with Drush.
function install_cucumber_with_drush() {
  echo "Install Cucumber with Drush.";
  ddev drush site-install cucumber --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" ;
}

# Enable Cucumber extra components.
function enable_cucumber_extra_components() {
  echo "Enable Cucumber extra components.";
}
