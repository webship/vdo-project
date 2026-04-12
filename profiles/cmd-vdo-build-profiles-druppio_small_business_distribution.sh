#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Druppio small business distribution         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/druppio_small_business_distribution |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl druppio_small_business_distribution --drupal-project-rename=druppio_small_business_distribution;


