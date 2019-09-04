#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Sector                                      |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/sector             |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project sparksinteractive/sector-project sector ;

full_database_name="${database_prefix}sector";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
