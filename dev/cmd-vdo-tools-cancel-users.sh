#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;
source ${vdo_scripts}/functions/fun-vdo-users.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

ARGPARSE_DESCRIPTION="Cancle users from a project and delete their content"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('USER_LIST_NAME',
                    help='The name of the user list for the profile.')
EOF

shift $#;

cancel_users ${PROJECT_NAME} ${USER_LIST_NAME};
