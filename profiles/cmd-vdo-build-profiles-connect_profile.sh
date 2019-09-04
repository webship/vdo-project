#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Connect profile                             |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/connect_profile    |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl connect_profile --drupal-project-rename=connect_profile;

full_database_name="${database_prefix}connect_profile";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"

