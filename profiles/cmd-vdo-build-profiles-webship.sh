#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Webship                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/webship            |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project webship/webship-project:8.2.x-dev webship --stability dev --no-interaction ;

full_database_name="${database_prefix}webship";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
