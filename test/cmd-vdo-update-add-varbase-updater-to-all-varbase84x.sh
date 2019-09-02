#!/bin/usr/env bash

drupal_version="8";
major_version="4";



# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);



for version in {20..28..1}
  do
    progress_bar ${version} 28 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${project_name}";

    if [ -d "${project_path}" ]; then
      cd ${project_path} ;
      composer require vardot/varbase-updater:~1.0 |& tee -a ${doc_path}/add-varbase-updater-${project_name}.text ;
    fi
  done
