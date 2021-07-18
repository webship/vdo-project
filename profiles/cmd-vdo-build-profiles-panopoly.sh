#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Panopoly                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/panopoly           |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project panopoly/panopoly-composer-template:8.x-dev panopoly --no-interaction;

full_database_name="${database_prefix}panopoly";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
