#!/bin/usr/env bash

drupal_version="8";
major_version="5";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);


for version in {0..5..1}
  do
    progress_bar ${version} 5 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${doc_name}/${project_name}";

    if [ -d "${project_path}" ]; then
      cd ${project_path} ;
      bash ./bin/update-varbase.sh  |& tee -a ${doc_path}/${doc_name}/bash-bin-update-varbase-sh-${project_name}.text ;
    fi
  done
