#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Full test varbase updater for all varbase versions.

# Full test update all varbase 8.7.x to the latest
# We run 1 time.
# one from 8.7.* to 8.7.latest
# This will test if the site is the latest. 
#bash cmd-vdo-update-remove-all-varbase87x.sh
#bash cmd-vdo-update-build-all-varbase87x.sh
#bash cmd-vdo-update-varbase-sh-to-all-varbase87x.sh

# Full test update all varbase 8.6.x to the latest
# We run 2 times. one from 8.6.* to 8.6.12
# and then from 8.6.12 to 8.7.0
bash cmd-vdo-update-remove-all-varbase86x.sh
bash cmd-vdo-update-build-all-varbase86x.sh
bash cmd-vdo-update-add-varbase-updater-to-all-varbase86x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase86x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase86x.sh

# Full test update all varbase 8.5.x to the latest
# We run 4 times.
# one from 8.5.* to 8.5.5
# and then from 8.5.5 to 8.6.3
# and then from 8.6.3 to 8.6.12
# and after that from 8.6.12 to 8.7.0
bash cmd-vdo-update-remove-all-varbase85x.sh
bash cmd-vdo-update-build-all-varbase85x.sh
bash cmd-vdo-update-add-varbase-updater-to-all-varbase85x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase85x.sh

# Full test update all varbase 8.4.x to the latest
# We run 4 times.
# one from 8.4.* to 8.4.28
# and then from 8.4.28 to 8.6.3
# and then from 8.6.3 to 8.6.12
# and after that from 8.6.12 to 8.7.0
bash cmd-vdo-update-remove-all-varbase84x.sh
bash cmd-vdo-update-build-all-varbase84x.sh
bash cmd-vdo-update-add-varbase-updater-to-all-varbase84x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
bash cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
