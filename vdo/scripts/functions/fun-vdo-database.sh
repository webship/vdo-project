#!/bin/usr/env bash

function drop_database() {
  echo "Drop the old database if exists and create a new one with the standard character set";
  mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -vvv
   -vvv
}