#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Zircon profile                              |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/zircon_profile     |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl zircon_profile --drupal-project-rename=zircon_profile;


