#!/bin/usr/env bash

# Install Varbase with Drush.
function install_varbase_with_drush() {
  echo "Install Varbase with Drush.";
  ../vendor/drush/drush/drush site:install varbase --yes --site-name="${doc_name} ${PROJECT_NAME}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}"  --db-url="mysql://${database_username}:${database_password}@${database_host}:${database_port}/${full_database_name}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL -vvv;
}

# Enable Varbase extra components.
function enable_varbase_extra_components() {
  echo "Enable Varbase extra components.";
  ../vendor/drush/drush/drush pm:enable varbase_development --yes ;
  ../vendor/drush/drush/drush pm:enable varbase_api --yes ;
  ../vendor/drush/drush/drush pm:enable varbase_ai --yes ;
  ../vendor/drush/drush/drush pm:enable varbase_content_planner --yes ;
  ../vendor/drush/drush/drush pm:enable varbase_media_instagram --yes ;
  ../vendor/drush/drush/drush pm:enable varbase_media_twitter --yes ;
  ../vendor/drush/drush/drush pm:enable social_auth_facebook --yes ;
  ../vendor/drush/drush/drush pm:enable social_auth_twitter --yes ;
  ../vendor/drush/drush/drush pm:enable social_auth_linkedin --yes ;

  # Set the API key and org for OpenAI.
  ../bin/drush -y config:set openai.settings api_key ${openai_api_key};
  ../bin/drush -y config:set openai.settings api_org ${openai_api_org};
}
