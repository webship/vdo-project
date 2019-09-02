#!/bin/usr/env bash

drupal_version="8";
major_version="6";

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);


for version in {0..13..1}
  do
    progress_bar ${version} 13 ;
    project_name="varbase${drupal_version}${major_version}${version}";
    project_path="${doc_path}/${project_name}";

    if [ -d "${project_path}" ]; then
      cd ${project_path} ;
      bash ./bin/update-varbase.sh  |& tee -a ${doc_path}/bash-bin-update-varbase-sh-${project_name}.text ;
    fi
  done
