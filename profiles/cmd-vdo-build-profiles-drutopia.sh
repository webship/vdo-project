#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Drutopia                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/drutopia           |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project drutopia/drutopia_template:dev-master drutopia --no-interaction ;


