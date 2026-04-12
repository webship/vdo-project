#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Multipurpose Corporate Profile              |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/multipurpose_corporate_profile |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl multipurpose_corporate_profile --drupal-project-rename=multipurpose_corporate_profile;


