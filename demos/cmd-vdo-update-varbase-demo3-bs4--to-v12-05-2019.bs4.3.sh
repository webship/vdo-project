#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.demos.settings.yml);

# After changing the code to v12-05-2019.bs4.3 - or a branch from the tag
git checkout v12-05-2019.bs4.3

cd docroot/
drush cr
drush updb
drush cr

# To import updated confgurations at once.
drush cim

# If drush cim worked we do not need to do the folliwng, if the update status is off.
# to mark the updater as updated.
drush varbase-up varbase_core varbase_core_optional_update_8601
drush varbase-up varbase_core varbase_core_optional_update_8602
drush varbase-up varbase_core varbase_core_optional_update_8603
drush varbase-up varbase_core varbase_core_optional_update_8604
drush varbase-up varbase_core varbase_core_optional_update_8605
drush varbase-up varbase_core varbase_core_optional_update_8606
drush varbase-up varbase_core varbase_core_optional_update_8607

drush varbase-up --force varbase_core varbase_core_optional_update_8601
drush varbase-up --force varbase_core varbase_core_optional_update_8602
drush varbase-up --force varbase_core varbase_core_optional_update_8603
drush varbase-up --force varbase_core varbase_core_optional_update_8604
drush varbase-up --force varbase_core varbase_core_optional_update_8605
drush varbase-up --force varbase_core varbase_core_optional_update_8606
drush varbase-up --force varbase_core varbase_core_optional_update_8607

drush cr

# Again To import updated confgurations at once to correct.
drush cim

# To remove old Vartheme BS4 theme. as not it is in themes/contrib if we checked out the v12-05-2019.bs4.3 tag we do not need to do the following
rm -rf themes/custom
drush cr

