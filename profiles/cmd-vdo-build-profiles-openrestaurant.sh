#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build OpenRestaurant                              |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/openrestaurant     |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project openrestaurant/openrestaurant-project openrestaurant --no-interaction;


