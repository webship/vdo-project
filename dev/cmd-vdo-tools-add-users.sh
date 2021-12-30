#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;


# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.dev.settings.yml);

ARGPARSE_DESCRIPTION="Add users to a project"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('distribution_NAME',
                    help='The name of the user list for the profile.')
EOF

shift $#;

add_users ${PROJECT_NAME} ${distribution_NAME};
