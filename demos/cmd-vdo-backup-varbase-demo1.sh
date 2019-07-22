#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.demos.settings.yml);

tar -cvzf ${vdo_root}/demos/backups/varbase-demo1--$( date '+%Y-%m-%d_%H-%M-%S' ).tar.gz demo1 ;
mysqldump -u${database_username} -p${database_password} demos_demo1 > ${vdo_root}/demos/backups/varbase-demo1-db-$( date '+%Y-%m-%d_%H-%M-%S' ).sql ;
