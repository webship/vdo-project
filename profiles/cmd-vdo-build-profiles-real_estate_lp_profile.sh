#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Real Estate Landing Profile                 |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/real_estate_lp_profile |";
echo "*---------------------------------------------------*";

drush dl real_estate_lp_profile --drupal-project-rename=real_estate_lp_profile;

full_database_name="${database_prefix}real_estate_lp_profile";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
