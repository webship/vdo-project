#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build degov                                       |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/degov              |";
echo "*---------------------------------------------------*";

drush dl degov --drupal-project-rename=degov;

full_database_name="${database_prefix}degov";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
