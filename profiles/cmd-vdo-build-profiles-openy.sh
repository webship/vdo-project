#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build OpenY                                       |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/openy              |";
echo "*---------------------------------------------------*";

composer create-project ymcatwincities/openy-project openy --no-interaction --no-dev;

full_database_name="${database_prefix}openy";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
