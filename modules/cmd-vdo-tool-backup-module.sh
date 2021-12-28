#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.modules.settings.yml);

ARGPARSE_DESCRIPTION="Backup a module folder"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
EOF

shift $#;

backup_time=$( date '+%Y-%m-%d_%H-%M-%S' );
tar -cvzf ${vdo_backups}/${doc_name}/${doc_name}---${PROJECT_NAME}--${backup_time}.tar.gz ${PROJECT_NAME} ;
