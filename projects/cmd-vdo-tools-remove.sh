#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.projects.settings.yml);


ARGPARSE_DESCRIPTION="Remove a project"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
EOF

shift $#;


# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${PROJECT_NAME}" ]; then
  echo "--------------";
  sudo rm -rf ${PROJECT_NAME}
  echo "Deleted: ${vdo_root}/${doc_name}/${PROJECT_NAME}";
  echo "--------------";

  full_database_name="${database_prefix}${PROJECT_NAME}";
  mysql -u${database_username} -p${database_password} -e "DROP DATABASE IF EXISTS ${full_database_name};" -v
fi
