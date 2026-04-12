#!/bin/usr/env bash

# Install Drupal with Drush.
function install_drupal_with_drush() {
    echo "Install Drupal with Drush.";
  ddev drush site:install ${PROFILE} --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" --locale="en" install_configure_form.enable_update_status_emails=NULL --debug -vvv ;
}

# Enable Drupal extra components.
function enable_drupal_extra_components() {
  echo "Enable Drupal extra components.";

}
