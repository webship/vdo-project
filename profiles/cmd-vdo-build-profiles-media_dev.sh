#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build media_dev                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/bamedia_devse      |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl media_dev --drupal-project-rename=media_dev;


