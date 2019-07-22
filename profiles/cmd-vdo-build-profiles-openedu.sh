#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Openedu                                     |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/openedu            |";
echo "*---------------------------------------------------*";

composer create-project imagex/openedu-project openedu --no-interaction;

full_database_name="${database_prefix}openedu";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
