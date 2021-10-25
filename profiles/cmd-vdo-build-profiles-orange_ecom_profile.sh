#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Orange E-commerce Profile                         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/orange_ecom_profile|";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

composer create-project acromedia/drupal-orange-project orange_ecom_profile --stability dev --no-interaction;

full_database_name="${database_prefix}orange_ecom_profile";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
