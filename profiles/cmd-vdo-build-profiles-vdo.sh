#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build VDO                                         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/vdo                |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project webship/vdo-project:9.0.x-dev vdo --stability dev --no-interaction ;


