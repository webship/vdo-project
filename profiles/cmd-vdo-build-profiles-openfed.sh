#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Openfed                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/openfed            |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project openfed/openfed8-project:~10 openfed --no-interaction;

full_database_name="${database_prefix}openfed";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
