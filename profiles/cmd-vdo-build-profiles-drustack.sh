#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build DruStack                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/drustack           |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project drustack/framework-standard-edition:^8.4.0 drustack --no-interaction ;

full_database_name="${database_prefix}drustack";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
