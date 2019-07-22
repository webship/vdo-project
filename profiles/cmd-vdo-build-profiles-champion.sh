#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Champion                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/champion           |";
echo "*---------------------------------------------------*";

drush dl champion --drupal-project-rename=champion;

full_database_name="${database_prefix}champion";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"

