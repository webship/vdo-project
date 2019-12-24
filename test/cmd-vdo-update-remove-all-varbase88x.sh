#!/bin/usr/env bash

drupal_version="8";
major_version="8";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

for version in {0..0..1}
  do
    progress_bar ${version} 0 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${project_name}";

    if [ -d "${project_path}" ]; then
      sudo rm -rf ${project_path}
    fi

    full_database_name="${database_prefix}${project_name}";
    mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};"

  done
