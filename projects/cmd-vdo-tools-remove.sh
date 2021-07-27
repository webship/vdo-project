#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.projects.settings.yml);


# GET the project name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your project.";
  exit 1;
fi


# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${project_name}" ]; then
  echo "--------------";
  sudo rm -rf ${project_name}
  echo "Deleted: ${vdo_root}/${doc_name}/${project_name}";
  echo "--------------";

  full_database_name="${database_prefix}${project_name}";
  mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -v
fi
