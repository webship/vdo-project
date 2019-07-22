#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Base                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/govcms8            |";
echo "*---------------------------------------------------*";

composer create-project --stability dev --prefer-dist govcms/govcms8-project govcms8 ;

full_database_name="${database_prefix}govcms8";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
