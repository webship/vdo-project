#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Panopoly                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/panopoly           |";
echo "*---------------------------------------------------*";

composer create-project panopoly/panopoly-composer-template:8.x-dev panopoly --no-interaction;

full_database_name="${database_prefix}panopoly";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"