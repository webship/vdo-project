#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Droopler                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/droopler           |";
echo "*---------------------------------------------------*";

composer create-project droptica/droopler-project droopler --no-interaction;

full_database_name="${database_prefix}droopler";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
