#!/bin/usr/env bash

# Install Varbase with Drush.
function install_varbase_with_drush() {
  echo "Install Varbase with Drush.";
  ddev drush site:install varbase --yes --site-name="${doc_name} ${PROJECT_NAME}"  --account-name="${account_name}"  --account-pass="${account_pass}"  --account-mail="${account_mail}" --locale="en" varbase_multilingual_configuration.enable_multilingual=true varbase_extra_components.vmi=true varbase_extra_components.varbase_heroslider=true varbase_extra_components.varbase_carousels=true varbase_extra_components.varbase_search=true varbase_extra_components.varbase_blog=true varbase_extra_components.varbase_auth=true  install_configure_form.enable_update_status_emails=NULL -vvv;
}

# Enable Varbase extra components.
function enable_varbase_extra_components() {
  echo "Enable Varbase extra components.";
  ddev drush pm:enable varbase_development --yes ;
  ddev drush pm:enable varbase_api --yes ;
  ddev drush pm:enable varbase_ai --yes ;
  ddev drush pm:enable varbase_content_planner --yes ;
  ddev drush pm:enable varbase_media_instagram --yes ;
  ddev drush pm:enable varbase_media_twitter --yes ;
  ddev drush pm:enable social_auth_facebook --yes ;
  ddev drush pm:enable social_auth_twitter --yes ;
  ddev drush pm:enable social_auth_linkedin --yes ;

  # Set the API key and org for OpenAI.
  ddev drush -y config:set openai.settings api_key ${openai_api_key};
  ddev drush -y config:set openai.settings api_org ${openai_api_org};
}
