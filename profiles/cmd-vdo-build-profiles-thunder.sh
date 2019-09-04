#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Thunder                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/thunder            |";
echo "*---------------------------------------------------*";

composer create-project thunder/thunder-project thunder --no-interaction --no-install ;

full_database_name="${database_prefix}thunder";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
