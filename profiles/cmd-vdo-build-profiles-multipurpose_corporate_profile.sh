#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Multipurpose Corporate Profile              |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/multipurpose_corporate_profile |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

drush dl multipurpose_corporate_profile --drupal-project-rename=multipurpose_corporate_profile;

full_database_name="${database_prefix}multipurpose_corporate_profile";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
