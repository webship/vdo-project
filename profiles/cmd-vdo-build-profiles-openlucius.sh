#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build OpenLucius                                  |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/openlucius         |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project lucius-digital/openlucius-project openlucius --stability dev --no-interaction ;


