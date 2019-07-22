#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build VDO                                         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/vdo                |";
echo "*---------------------------------------------------*";

composer create-project webship/vdo-project:8.1.x-dev vdo --stability dev --no-interaction ;

full_database_name="${database_prefix}vdo";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
