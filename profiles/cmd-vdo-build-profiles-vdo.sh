#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build VDO                                         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/vdo                |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project webship/vdo-project:8.1.x-dev vdo --stability dev --no-interaction ;

full_database_name="${database_prefix}vdo";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
