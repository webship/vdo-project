#!/bin/usr/env bash

echo "*-----------------------------------------------------------*";
echo "| Install all Back-End admin themes                         |";
echo "*-----------------------------------------------------------*";
echo "| ${vdo_config}/workspace.themes.settings.yml";
echo "*-----------------------------------------------------------*"

current_path=$(pwd);

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.themes.settings.yml);

# Change file mod and owner.
sudo chmod 775 -R ${vdo_root}/themes/ ;
sudo chown www-data:${USER} -R ${vdo_root}/themes/ ;

# Install all admin themes in the admin theme list.
for admin_theme_name in "${admin_themes[@]}"
do
  cd "${vdo_root}/themes/" ;
  . cmd-vdo-install-admin-theme.sh ${admin_theme_name} ;
done
