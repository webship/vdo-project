#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

for dir_name in *; do
    if [[ -d "$dir_name" && ! -L "$dir_name" ]]; then
        if [ -f "${vdo_root}/${doc_name}/${dir_name}/.git/config" ]; then
          sed -i -e 's/filemode = true/filemode = false/g' ${vdo_root}/${doc_name}/${dir_name}/.git/config
        fi
    fi
done
