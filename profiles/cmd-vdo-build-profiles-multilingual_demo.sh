#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Base                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/multilingual_demo  |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl multilingual_demo --drupal-project-rename=multilingual_demo;

full_database_name="${database_prefix}multilingual_demo";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
