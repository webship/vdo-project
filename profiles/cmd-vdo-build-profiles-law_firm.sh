#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Law Firm                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/law_firm           |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl law_firm --drupal-project-rename=law_firm;

full_database_name="${database_prefix}law_firm";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
