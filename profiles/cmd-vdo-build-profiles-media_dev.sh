#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build media_dev                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/bamedia_devse      |";
echo "*---------------------------------------------------*";

drush dl media_dev --drupal-project-rename=media_dev;

full_database_name="${database_prefix}media_dev";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"