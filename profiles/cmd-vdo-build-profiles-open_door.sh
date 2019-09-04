#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Open door                                   |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/open_door          |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl open_door --drupal-project-rename=open_door;

full_database_name="${database_prefix}open_door";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
