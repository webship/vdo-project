#!/bin/usr/env bash

argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('-i', '--install',
                    action='store_true',
                    default=False,
                    help='Add the install flag to install the project.')
parser.add_argument('-a', '--add-users',
                    action='store_true',
                    default=False,
                    help='Add default set of users to the project in the case of install')
parser.add_argument('-r', '--require',
                    default="_none_",
                    nargs='+',
                    help='Require more modules/themes/libraries by composer. Example: --require "drupal/ctools:~3.0 drupal/token:~1.0"')
parser.add_argument('-e', '--enable',
                    default="_none_",
                    nargs='+',
                    help='Enable modules right after the install. Example: --enable "media media_library ctools token"')
parser.add_argument('-s', '--skip-set-default-settings',
                    action='store_true',
                    default=False,
                    help='Skip set default settings file before starting the install')
parser.add_argument('-d', '--skip-drop-database',
                    action='store_true',
                    default=False,
                    help='Skip drop the database and create it again before starting the install')
parser.add_argument('-g', '--gleap',
                    action='store_true',
                    default=False,
                    help='Add the Varbase Gleap module with the Gleap API Key for Varbase reporting to JIRA')
EOF