#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build dcco                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/dcco               |";
echo "*---------------------------------------------------*";

drush dl dcco-8.x-2.x-dev --drupal-project-rename=dcco;

full_database_name="${database_prefix}dcco";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"