#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Opigno LMS                                  |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/opigno_lms         |";
echo "*---------------------------------------------------*";

composer create-project opigno/opigno-composer opigno_lms --no-interaction;

full_database_name="${database_prefix}opigno_lms";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
