#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Pino                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/pino               |";
echo "*---------------------------------------------------*";

composer create-project risse/pino-project pino --no-interaction;

full_database_name="${database_prefix}pino";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
