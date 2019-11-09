#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

cd ${vdo_root}/${doc_name}/
composer create-project vardot/varbase-project:8.8.x-dev varbase6c --stability dev --no-interaction
cd ${vdo_root}/${doc_name}/varbase8c/
composer require 'drupal/varbase_reports:6.x-dev' \
                  'drupal/varbase_media_header:7.x-dev' \
                  'vardot/varbase_vmi_demo:dev-8.x-7.x' \
                  'vardot/varbase_story_demo:dev-8.x-7.x' \
                  'drupal/varbase_faqs:6.x-dev' \
                  'drupal/varbase_layout_builder:1.x-dev' ;


sudo chmod 775 -R .;sudo chown www-data:${user} -R .;
cd ${vdo_root}/${doc_name}/varbase8c/docroot

drush site-install varbase --yes \
  --site-name="dev Varbase7" \
  --account-name="${account_name}" \
  --account-pass="${account_pass}" \
  --account-mail="${account_mail}" \
  --db-url="mysql://${database_username}:${database_passeord}@${database_host}/dev_varbase6c" \
  varbase_multilingual_configuration.enable_multilingual=1 \
  varbase_extra_components.vmi=1 \
  varbase_extra_components.varbase_heroslider_media=1 \
  varbase_extra_components.varbase_carousels=1 \
  varbase_extra_components.varbase_search=1 \
  varbase_extra_components.varbase_blog=1 \
  varbase_extra_components.varbase_api=1 \
  varbase_development_tools.varbase_development=1 -vvv;

drush pm-enable varbase_media_instagram --yes ;
drush pm-enable varbase_media_twitter --yes ;
drush pm-enable social_auth_google --yes ;
drush pm-enable social_auth_facebook --yes ;
drush pm-enable social_auth_twitter --yes ;
drush pm-enable social_auth_linkedin --yes ;
drush pm-enable varbase_faqs --yes ;
drush pm-enable varbase_reports --yes ;
drush pm-enable varbase_media_header --yes ;
drush pm-enable varbase_vmi_demo --yes ;
drush pm-enable varbase_vmi_standard_demo --yes;
drush pm-enable varbase_story_demo --yes ;
drush pm-enable varbase_layout_builder --yes ;

