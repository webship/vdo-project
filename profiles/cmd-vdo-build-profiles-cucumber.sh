#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Cucumber                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/cucumber           |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project webship/cucumber-project:9.0.x-dev cucumber --stability dev --no-interaction ;

full_database_name="${database_prefix}cucumber";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"


