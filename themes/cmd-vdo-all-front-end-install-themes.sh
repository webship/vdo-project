#!/bin/usr/env bash

echo "*-----------------------------------------------------------*";
echo "| Install all Front-End themes                              |";
echo "*-----------------------------------------------------------*";
echo "| ${vdo_config}/workspace.themes.settings.yml";
echo "*-----------------------------------------------------------*"

current_path=$(pwd);

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.themes.settings.yml);

# Change file mod and owner.
sudo chmod 775 -R ${vdo_root}/themes/ ;
sudo chown www-data:${USER} -R ${vdo_root}/themes/ ;

# Install all themes in the themes list.
for theme_name in "${themes[@]}"
do
  cd "${vdo_root}/themes/" ;
  . cmd-vdo-install-theme.sh ${theme_name} ;
done
