#!/bin/usr/env bash

drupal_version="8";
major_version="8";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

for version in {0..11..1}
  do
    progress_bar ${version} 11 ;

    project_name="varbase${drupal_version}${major_version}${version}";

    if [ -d "${vdo_root}/${doc_name}/${project_name}" ]; then
      sudo rm -rf ${vdo_root}/${doc_name}/${project_name} ;
    fi

    full_database_name="${database_prefix}${project_name}";
    mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -v ;

  done

cd ${vdo_root}/${doc_name} ;
