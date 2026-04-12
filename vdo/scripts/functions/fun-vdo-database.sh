#!/bin/usr/env bash

function drop_database() {
  echo "Drop the old database if exists.";
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
  ddev drush sql-drop --yes ;
  cd ${vdo_root}/${doc_name} ;
}
