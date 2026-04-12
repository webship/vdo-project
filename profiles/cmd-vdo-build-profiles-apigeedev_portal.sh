#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Apigee devportal                            |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/apigeedev_portal   |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl apigeedev_portal --drupal-project-rename=apigeedev_portal;


