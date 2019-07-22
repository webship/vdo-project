#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi

full_database_name="${database_prefix}${project_name}";

tar -cvzf ${doc_path}/${doc_name}/backups/${doc_name}_${project_name}--$( date '+%Y-%m-%d_%H-%M-%S' ).tar.gz ${project_name} ;
mysqldump -u${database_username} -p${database_password} ${full_database_name} > ${doc_path}/${doc_name}/backups/${database_prefix}${project_name}-db-$( date '+%Y-%m-%d_%H-%M-%S' ).sql ;
