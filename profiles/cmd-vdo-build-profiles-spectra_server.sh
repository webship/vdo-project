#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Spectra Analytics Server                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/spectra_server     |";
echo "*---------------------------------------------------*";

drush dl spectra_server --drupal-project-rename=spectra_server;

full_database_name="${database_prefix}spectra_server";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
