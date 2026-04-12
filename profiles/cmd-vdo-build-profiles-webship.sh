#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Webship                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/webship            |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project webship/webship-project:9.1.x-dev webship --stability dev --no-interaction ;


