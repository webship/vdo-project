#!/bin/usr/env bash

echo "*-----------------------------------------------------------*";
echo "| Build all Back-End admin themes                           |";
echo "*-----------------------------------------------------------*";
echo "| ${vdo_config}/workspace.themes.settings.yml";
echo "*-----------------------------------------------------------*"

current_path=$(pwd);

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.themes.settings.yml);

cd ${vdo_root}/themes/ ;

# Delete old Admin themes.
for admin_theme_name in "${admin_themes[@]}"
do
  rm -rf ${vdo_root}/themes/${admin_theme_name};
done


cd ${vdo_root}/themes/ ;

rm -rf ${vdo_root}/themes/${vdo_drupal_template_drupal_theme_name} ;
ddev composer create-project drupal/recommended-project:~9.0 ${vdo_drupal_template_drupal_theme_name} --stability dev --no-interaction ;




# Build all admin themes in the admin theme list.
for admin_theme_name in "${admin_themes[@]}"
do
  cd ${vdo_root}/themes/ ;
  . cmd-vdo-build-admin-theme.sh ${admin_theme_name};
done

# Change file mod and owner.

