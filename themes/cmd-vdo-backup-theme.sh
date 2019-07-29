#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.themes.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your theme.";
  exit 1;
fi

full_database_name="${database_prefix}${project_name}";

backup_time=$( date '+%Y-%m-%d_%H-%M-%S' );
tar -cvzf ${vdo_backups}/${doc_name}/${doc_name}---${project_name}--${backup_time}.tar.gz ${project_name} ;
mysqldump -u${database_username} -p${database_password} ${full_database_name} > ${vdo_backups}/${doc_name}/${doc_name}---${project_name}--${backup_time}-db.sql ;