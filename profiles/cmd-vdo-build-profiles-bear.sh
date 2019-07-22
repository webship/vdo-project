#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Bear                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/bear               |";
echo "*---------------------------------------------------*";

composer create-project -s alpha zivtech/bear-project bear ;

full_database_name="${database_prefix}bear";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"

