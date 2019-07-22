#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build agov                                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/agov               |";
echo "*---------------------------------------------------*";

composer create-project drupal/drupal:* agov --stability dev --no-interaction
cd ${doc_path}/${doc_name}/agov ;
composer require previousnext/agov:dev-8.x-2.x ;

cd ${doc_path}/${doc_name} ;
full_database_name="${database_prefix}agov";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
