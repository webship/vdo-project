#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Stratus Meridian Developer Portal           |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/sm_dev_portal      |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project stratus-meridian/drupal8-composer-project:8.x-dev sm_dev_portal --no-interaction;

full_database_name="${database_prefix}sm_dev_portal";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
