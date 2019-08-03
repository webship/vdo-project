#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Cucumber                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/cucumber           |";
echo "*---------------------------------------------------*";

composer create-project webship/cucumber-project:8.1.x-dev cucumber --stability dev --no-interaction ;

full_database_name="${database_prefix}cucumber";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
