#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Real Estate Landing Profile                 |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/real_estate_lp_profile |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl real_estate_lp_profile --drupal-project-rename=real_estate_lp_profile;


