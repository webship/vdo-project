#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Guardr                                      |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/guardr             |";
echo "*---------------------------------------------------*";

drush dl guardr --drupal-project-rename=guardr;

full_database_name="${database_prefix}guardr";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
