#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Niobi Research Center                       |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/niobi              |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev drush dl niobi --drupal-project-rename=niobi;


