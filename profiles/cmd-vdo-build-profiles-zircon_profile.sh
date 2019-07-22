#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Zircon profile                              |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/zircon_profile     |";
echo "*---------------------------------------------------*";

drush dl zircon_profile --drupal-project-rename=zircon_profile;

full_database_name="${database_prefix}zircon_profile";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
