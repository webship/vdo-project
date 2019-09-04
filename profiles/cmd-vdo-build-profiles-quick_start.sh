#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Quick Start                                 |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/quick_start        |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);


composer create-project drupalcoders/quick_start_distro:dev-master quick_start --no-dev --no-interaction --prefer-dist;


full_database_name="${database_prefix}quick_start";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
