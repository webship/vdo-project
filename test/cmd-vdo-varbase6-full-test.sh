#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

cd ${vdo_root}/dev/
composer create-project vardot/varbase-project:8.6.x-dev varbase6c --stability dev --no-interaction
cd ${vdo_root}/dev/varbase6c/
composer require vardot/varbase_vmi_demo:dev-8.x-6.x
composer require vardot/varbase_story_demo:dev-8.x-6.x
sudo chmod 775 -R .;sudo chown www-data:${user} -R .;
cd ${vdo_root}/dev/varbase6c/docroot
drush site-install varbase --yes  \
  --site-name="dev Varbase6" \
  --account-name=${account_name} \
  --account-pass="${account_pass}" \
  --account-mail="${account_mail}" \
  --db-url="mysql://${database_username}:${database_password}@${database_host}/dev_varbase6c" \
  varbase_multilingual_configuration.enable_multilingual=1 \
  varbase_extra_components.vmi=1 \
  varbase_extra_components.varbase_heroslider_media=1 \
  varbase_extra_components.varbase_carousels=1 \
  varbase_extra_components.varbase_search=1 \
  varbase_extra_components.varbase_blog=1 \
  varbase_development_tools.varbase_development=1 -vvv;

drush em vbp_text_and_image;
drush en varbase_vmi_demo;
drush en varbase_vmi_standard_demo;
drush en varbase_story_demo;

