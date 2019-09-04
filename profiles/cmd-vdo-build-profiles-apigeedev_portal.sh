#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Apigee devportal                            |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/apigeedev_portal   |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl apigeedev_portal --drupal-project-rename=apigeedev_portal;

full_database_name="${database_prefix}apigeedev_portal";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"

