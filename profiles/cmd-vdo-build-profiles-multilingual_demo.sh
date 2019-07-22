#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Base                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/multilingual_demo  |";
echo "*---------------------------------------------------*";

drush dl multilingual_demo --drupal-project-rename=multilingual_demo;

full_database_name="${database_prefix}multilingual_demo";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
