#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Set site version.
site_version="9.2.x-dev";

ARGPARSE_DESCRIPTION="Add new Varbase 9.2.x-dev ready Automated testing builds with DDEV, and install. Then run tests using webship-js (cucumber).(chromium)."
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
# Add new Varbase 9.2 ready Automated testing builds with DDEV, install,
# then run tests using webship-js (cucumber).
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

# Configure DDEV for Drupal 11 with docroot and PHP 8.4.
ddev config --project-type=drupal11 --docroot=docroot --php-version=8.4 ;
ddev start ;

# Create the Varbase 11 project via composer inside DDEV.
ddev composer create-project drupal/varbase_project:${site_version} --no-interaction ;

# Install JS dependencies (runs drupal-libraries-sync) and Playwright chromium.
ddev yarn install ;
ddev npx playwright install-deps chromium ;
ddev npx playwright install chromium ;

vdo_build_time=$( date '+%Y-%m-%d %H-%M-%S' );
echo "// VDO Built time: ${vdo_build_time}" >> ${vdo_root}/${doc_name}/${PROJECT_NAME}/docroot/sites/default/settings.php 2>/dev/null || true ;

# ---------------------------------------------------------------------------
# Install Varbase (classic profile) and provision the site the same way the
# GitLab CI webship-js job does. Uses the in-repo ddev command when present
# (varbase_project 9.2.x issue #3608527), else falls back to the inline steps
# so the script also works before that lands.
# ---------------------------------------------------------------------------
if ddev exec test -f .ddev/commands/web/init-full-automated-testing 2>/dev/null ; then
  ddev init-full-automated-testing ;
else
  ddev drush site:install varbase --yes \
    --account-name=webmaster --account-pass="dD.123123ddd" \
    --account-mail="webmaster@vardot.com" --site-name="${PROJECT_NAME}" --locale=en \
    varbase_multilingual_configuration.enable_multilingual=true \
    varbase_extra_components.vmi=true \
    varbase_extra_components.varbase_heroslider_media=true \
    varbase_extra_components.varbase_carousels=true \
    varbase_extra_components.varbase_search=true \
    varbase_extra_components.varbase_blog=true \
    varbase_extra_components.varbase_auth=true \
    install_configure_form.enable_update_status_emails=NULL ;
  for m in varbase_development varbase_styleguide varbase_landing varbase_api \
           varbase_media_instagram varbase_media_twitter editoria11y \
           symfony_mailer mailer_policy reroute_email varbase_content_planner ; do
    ddev drush pm:enable $m -y || true ;
  done
  ddev drush pm:enable social_auth_google social_auth_facebook -y || true ;
  ddev exec test -f tests/scripts/seed_content_planner_activity.php \
    && ddev drush php:script tests/scripts/seed_content_planner_activity.php || true ;
  ddev drush pm:uninstall antibot honeypot -y || true ;
  ddev drush config:set reroute_email.settings enable true -y || true ;
fi

# Tune for deterministic testing.
ddev drush config:set system.performance css.preprocess 0 --yes ;
ddev drush config:set system.performance js.preprocess 0 --yes ;
ddev drush config:set system.logging error_level all --yes ;
ddev drush cache:rebuild ;

# Notification.
echo "${doc_name} ${PROJECT_NAME} (Varbase ${site_version}) has been installed!!!!";
echo "-----------------------------------------";
echo " Change directory to the project:"
echo " cd ${vdo_root}/${doc_name}/${PROJECT_NAME}";
echo "-----------------------------------------";
echo " To run the full webship-js cucumber suite (chromium):";
echo " ddev yarn test:chromium   # or:  ddev exec ./node_modules/.bin/cucumber-js --config cucumber.js --tags \"not @wip\"";
echo "-----------------------------------------";
cd ${vdo_root}/${doc_name};

## Run the full automated test.
if $run_automated_testing ; then
  cd ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
  if ddev exec sh -c 'node -e "process.exit(require(\"./package.json\").scripts[\"test:chromium\"]?0:1)"' 2>/dev/null ; then
    ddev yarn test:chromium ;
  else
    ddev exec ./node_modules/.bin/cucumber-js --config cucumber.js --tags "not @wip" ;
  fi
fi
