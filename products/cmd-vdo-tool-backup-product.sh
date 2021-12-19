#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.products.settings.yml);

# GET the Product name argument.
if [ "$1" != "" ]; then
    project_name=$1;
else
  echo "Please add the name of your product.";
  exit 1;
fi

backup_time=$( date '+%Y-%m-%d_%H-%M-%S' );
tar -cvzf ${vdo_backups}/${doc_name}/${doc_name}---${project_name}--${backup_time}.tar.gz ${project_name} ;
