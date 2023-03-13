#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;


# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.sandboxes.settings.yml);

ARGPARSE_DESCRIPTION="Add Gleap to a project"
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('DISTRIBUTION_WEBROOT',
                    help='The Webroot folder name for the project (docroot, web, public_html)')
parser.add_argument('-e', '--enable',
                    action='store_true',
                    default=False,
                    help='Enable the Gleap module')
parser.add_argument('-d', '--disable',
                    action='store_true',
                    default=False,
                    help='Disable the Gleap module')
EOF

shift $#;

distribution_webroot=${DISTRIBUTION_WEBROOT};

add_gleap ${PROJECT_NAME} ${distribution_webroot}

if [ "$ENABLE" == 'yes' ]; then
  enable_gleap ${PROJECT_NAME} ${distribution_webroot}
fi

if [ "$DISABLE" == 'yes' ]; then
  disable_gleap ${PROJECT_NAME} ${distribution_webroot}
fi
