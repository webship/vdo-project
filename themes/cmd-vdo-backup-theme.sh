#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.themes.settings.yml);

ARGPARSE_DESCRIPTION="Backup a theme"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the theme.')
EOF

shift $#;

full_database_name="${database_prefix}${PROJECT_NAME}";

backup_time=$( date '+%Y-%m-%d_%H-%M-%S' );
tar -cvzf ${vdo_backups}/${doc_name}/${doc_name}---${PROJECT_NAME}--${backup_time}.tar.gz ${PROJECT_NAME} ;
mysqldump -u${database_username} -p${database_password} ${full_database_name} > ${vdo_backups}/${doc_name}/${doc_name}---${PROJECT_NAME}--${backup_time}-db.sql ;