#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Drutopia                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/drutopia           |";
echo "*---------------------------------------------------*";

composer create-project drutopia/drutopia_template:dev-master drutopia --no-interaction ;

full_database_name="${database_prefix}drutopia";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
