#!/bin/usr/env bash

# Install CV with Drush.
function install_cv_with_drush() {
  echo "Install CV with Drush.";
  ddev drush site-install cv --yes --site-name="${doc_name} ${PROJECT_NAME}" --account-name="${account_name}" --account-pass="${account_pass}" --account-mail="${account_mail}" varbase_development_tools.varbase_development=1 -vvv;
}

# Enable CV extra components.
function enable_cv_extra_components() {
  echo "Enable CV extra components.";
}
