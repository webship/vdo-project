#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build PanKM                                       |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/pankm              |";
echo "*---------------------------------------------------*";

drush dl pankm --drupal-project-rename=pankm;

full_database_name="${database_prefix}pankm";
mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"
mysql -u${database_username} -p${database_password} -e "CREATE DATABASE ${full_database_name};"
