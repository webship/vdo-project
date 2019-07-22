#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Bene                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/bene               |";
echo "*---------------------------------------------------*";

drush dl bene --drupal-project-rename=bene;

full_database_name="${database_prefix}bene";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"

