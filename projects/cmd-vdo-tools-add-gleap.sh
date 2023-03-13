#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;


# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.projects.settings.yml);

ARGPARSE_DESCRIPTION="Add Gleap to a project"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('DISTRIBUTION_WEBROOT',
                    help='The Webroot folder name for the project (docroot, web, public_html)')
EOF

shift $#;

distribution_webroot=${DISTRIBUTION_WEBROOT};

add_gleap ${PROJECT_NAME} ${distribution_webroot}
