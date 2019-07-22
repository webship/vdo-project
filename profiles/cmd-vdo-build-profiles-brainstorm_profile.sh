#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Droopler                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/brainstorm_profile |";
echo "*---------------------------------------------------*";

drush dl brainstorm_profile --drupal-project-rename=brainstorm_profile;

full_database_name="${database_prefix}brainstorm_profile";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"

