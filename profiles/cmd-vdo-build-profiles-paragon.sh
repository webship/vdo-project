#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Paragon                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/paragon            |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project elevatedthird/paragon-base paragon --no-interaction --stability=alpha;

full_database_name="${database_prefix}paragon";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
