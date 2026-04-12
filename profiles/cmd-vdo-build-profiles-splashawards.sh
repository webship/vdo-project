#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build SplashAwards                                |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/splashawards       |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project drupalnl/splashawards-project splashawards --no-interaction ;


