#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Openfed                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/openfed            |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project openfed/openfed8-project:~10 openfed --no-interaction;


