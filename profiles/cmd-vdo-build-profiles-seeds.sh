#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Seeds                                       |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/seeds              |";
echo "*---------------------------------------------------*";

composer create-project sprintive/seeds-project:* seeds --no-interaction;

full_database_name="${database_prefix}seeds";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
