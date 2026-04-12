#!/bin/usr/env bash

current_path=$(pwd);

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

# Delete old profiles.
for profile_name in "${profiles[@]}"
do
  cd ${vdo_root}/${doc_name} ;
  rm -rf ${vdo_root}/${doc_name}/${profile_name};
done

# Build all profiles in the profiles list.
for profile_name in "${profiles[@]}"
do
  cd ${vdo_root}/${doc_name} ;
  . cmd-vdo-build-profiles-${profile_name}.sh;
done

# Change file mod and owner.

