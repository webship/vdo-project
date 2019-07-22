#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Mandatory                                   |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/mandatory          |";
echo "*---------------------------------------------------*";

cd "${doc_path}/${doc_name}"
composer create-project drupal-composer/drupal-project:8.x-dev mandatory --stability dev --no-interaction
cd mandatory
composer require drupal/mandatory ;
cd "${doc_path}/${doc_name}";

full_database_name="${database_prefix}mandatory";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
