#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Law Firm                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/law_firm           |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl law_firm --drupal-project-rename=law_firm;


