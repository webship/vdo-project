#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;


# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

ARGPARSE_DESCRIPTION="Cancle users from a project and delete their content"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('DISTRIBUTION_NAME',
                    help='The name of the user list for the profile.')
EOF

shift $#;

distribution_name=${DISTRIBUTION_NAME};

cancel_users ${PROJECT_NAME} ${distribution_name};
