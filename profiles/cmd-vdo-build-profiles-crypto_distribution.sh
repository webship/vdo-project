#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Crypto Distribution                         |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/crypto_distribution|";
echo "*---------------------------------------------------*";

drush dl crypto_distribution --drupal-project-rename=crypto_distribution;

full_database_name="${database_prefix}crypto_distribution";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
