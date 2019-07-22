#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Multipurpose Corporate Profile              |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/multipurpose_corporate_profile |";
echo "*---------------------------------------------------*";

drush dl multipurpose_corporate_profile --drupal-project-rename=multipurpose_corporate_profile;

full_database_name="${database_prefix}multipurpose_corporate_profile";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
