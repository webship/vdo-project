#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Open door                                   |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/open_door          |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl open_door --drupal-project-rename=open_door;


