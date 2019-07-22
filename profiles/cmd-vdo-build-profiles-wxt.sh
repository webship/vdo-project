#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build WXT                                         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/wxt                |";
echo "*---------------------------------------------------*";

composer create-project drupalwxt/wxt-project:8.x-dev wxt --no-interaction;

full_database_name="${database_prefix}wxt";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
