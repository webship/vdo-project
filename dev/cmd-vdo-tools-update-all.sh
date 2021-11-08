#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

cd ${vdo_root}/${doc_name};
echo "=======================================================";
echo "  Update all projects in ${vdo_root}/${doc_name} ";
echo "=======================================================";
for project in *; do
    if [ -d "$project" ]; then
        echo "  $project   ";
    fi;
done;
for project in *; do
    if [ -d "$project" ]; then
        echo "=======================================================";
        echo "  ${vdo_root}/${doc_name}/${project}/   ";
        echo "=======================================================";
        cd ${vdo_root}/${doc_name}/${project};
        composer update -v;
    fi;
    cd ${vdo_root}/${doc_name}
done;