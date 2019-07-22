#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Newspublish                                 |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/newspublish        |";
echo "*---------------------------------------------------*";

drush dl newspublish --drupal-project-rename=newspublish;

full_database_name="${database_prefix}newspublish";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
