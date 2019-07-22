#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Dropsolid Rocketship                        |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/dropsolid_rocketship |";
echo "*---------------------------------------------------*";

composer create-project dropsolid/rocketship dropsolid_rocketship --no-dev --no-interaction ;

full_database_name="${database_prefix}dropsolid_rocketship";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
