#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Presto! -  Commerce Integration             |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/presto             |";
echo "*---------------------------------------------------*";

composer create-project sitback/presto-project presto --stability dev --no-interaction ;

full_database_name="${database_prefix}presto";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
