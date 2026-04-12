#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build University                                  |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/university         |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project front/university-project university --stability dev --no-interaction;


