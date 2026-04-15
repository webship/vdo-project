#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Set site version.
site_version="11.0.x-dev";

ARGPARSE_DESCRIPTION="Add new Varbase 11.0.x-dev ready Automated testing builds with DDEV, and install. Then run tests using Playwright (chromium)."
argparse "$@" <<EOF || exit 1
parser.add_argument('PROJECT_NAME',
                    help='The name of the project.')
parser.add_argument('TESTING_PATH',
                    default='tests/features/varbase',
                    nargs='?',
                    help='Testing path. default value [ tests/features/varbase ]')
parser.add_argument('-r', '--run',
                    action='store_true',
                    default=False,
                    help='Run the automate test with real browser. Shows the work of the driver on the browser.')
parser.add_argument('-b', '--run-no-headless',
                    action='store_true',
                    default=False,
                    help='Run a real no headless browser automate test. An alies for --run')
parser.add_argument('-l', '--run-headless',
                    action='store_true',
                    default=False,
                    help='Run a headless automate test. Hides the work of the driver on the browser.')
parser.add_argument('-n', '--no-headless',
                    action='store_true',
                    default=False,
                    help='Configure the test as a real browser with no headless automate test.')
parser.add_argument('-s', '--headless',
                    action='store_true',
                    default=False,
                    help='Configure the test as a headless automate test.')
EOF

shift $#;

# Help link:
# Add new Varbase 11 ready Automated testing builds with DDEV, install,
# then run tests using Playwright.
# ---------------------------------------------------
# https://github.com/webship/vdo-project/issues/50
# ---------------------------------------------------

# Default values.
run_automated_testing=false;
headless=true;

if [ "$RUN" == 'yes' ]; then
  run_automated_testing=true;
  headless=false;
fi

if [ "$RUN_NO_HEADLESS" == 'yes' ]; then
  run_automated_testing=true;
  headless=false;
fi

if [ "$RUN_HEADLESS" == 'yes' ]; then
  run_automated_testing=true;
  headless=true;
fi

if [ "$HEADLESS" == 'yes' ]; then
  headless=true;
fi

if [ "$NO_HEADLESS" == 'yes' ]; then
  headless=false;
fi

shift $#;

# Change directory to the workspace for this full operation.
cd ${vdo_root}/${doc_name};

if [ -d "${PROJECT_NAME}" ]; then
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
  ddev delete -Oy 2>/dev/null || true ;
  cd ${vdo_root}/${doc_name} ;
  rm -rf ${PROJECT_NAME} ;
fi

# Create the project directory.
mkdir ${PROJECT_NAME} ;
cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;

# Configure DDEV for Drupal 11 with web docroot and PHP 8.4.
ddev config --project-type=drupal11 --docroot=web --php-version=8.4 ;
ddev start ;

# Create the Varbase 11 project via composer inside DDEV.
ddev composer create-project drupal/varbase_project:${site_version} --no-interaction ;

# Initialize the full automated testing scaffold (Playwright + yarn workspace).
ddev init-full-automated-testing ;

# Install JS dependencies and Playwright browsers.
ddev yarn install ;
ddev npx playwright install-deps chromium ;
ddev npx playwright install chromium ;

vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/web/sites/default/settings.php 2>/dev/null || true ;

# Toggle headless mode in the Playwright config if present.
playwright_config="${vdo_root}/${doc_name}/${PROJECT_NAME}/playwright.config.ts" ;
if [ -f "${playwright_config}" ]; then
  if ! $headless ; then
    sed -i "s,headless: true,headless: false,g" ${playwright_config} ;
  else
    sed -i "s,headless: false,headless: true,g" ${playwright_config} ;
  fi
fi

# Rebuild caches and tune for testing.
ddev drush config:set system.performance css.preprocess 0 --yes ;
ddev drush config:set system.performance js.preprocess 0 --yes ;
ddev drush config:set system.logging error_level all --yes ;
ddev drush cache:rebuild ;

# Send a notification.
echo "${doc_name} ${PROJECT_NAME} (Varbase ${site_version}) has been installed!!!!";
echo "-----------------------------------------";
echo " Change directory to the project:"
echo " cd ${vdo_root}/${doc_name}/${PROJECT_NAME}";
echo "-----------------------------------------";
echo " To run the full Playwright test suite (chromium):";
echo " ddev yarn test:chromium";
echo "-----------------------------------------";
echo " To run a specific test path:";
echo " ddev npx playwright test ${TESTING_PATH}";
echo "-----------------------------------------";
cd ${vdo_root}/${doc_name};

## Run the full automated test.
if $run_automated_testing ; then
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
  ddev yarn test:chromium ;
fi
