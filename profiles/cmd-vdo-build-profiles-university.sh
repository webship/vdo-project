#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build University                                  |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/university         |";
echo "*---------------------------------------------------*";

composer create-project front/university-project university --stability dev --no-interaction;

full_database_name="${database_prefix}university";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
