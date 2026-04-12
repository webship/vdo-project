#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Guardr                                      |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/guardr             |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl guardr --drupal-project-rename=guardr;


