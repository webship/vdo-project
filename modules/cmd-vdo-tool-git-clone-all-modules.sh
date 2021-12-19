#!/bin/usr/env bash

echo "*-----------------------------------------------------------*";
echo "| GIT clone all modules in                                  |";
echo "*-----------------------------------------------------------*";
echo "| ${vdo_config}/workspace.modules.settings.yml";
echo "*-----------------------------------------------------------*"

current_path=$(pwd);

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.modules.settings.yml);

cd ${vdo_root}/modules/ ;

# Delete modules.
for module_name in "${modules[@]}"
do
  sudo rm -rf ${vdo_root}/modules/${module_name};
done

# GIT clone modules.
for module_name in "${modules[@]}"
do
  git clone git@git.drupal.org:project/${module_name}.git ;
  echo "*-----------------------------------------------------------*";
done
