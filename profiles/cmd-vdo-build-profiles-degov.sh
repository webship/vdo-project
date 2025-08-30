#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build degov                                       |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/degov              |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project degov/degov-project degov --no-interaction;

full_database_name="${database_prefix}degov";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"

