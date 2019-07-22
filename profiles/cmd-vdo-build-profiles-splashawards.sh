#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build SplashAwards                                |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/splashawards       |";
echo "*---------------------------------------------------*";

composer create-project drupalnl/splashawards-project splashawards --no-interaction ;

full_database_name="${database_prefix}splashawards";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
