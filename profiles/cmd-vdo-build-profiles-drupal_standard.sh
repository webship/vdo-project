#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Drupal standard                             |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/drupal             |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project drupal/recommended-project drupal_standard --no-interaction ;

full_database_name="${database_prefix}drupal_standard";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
