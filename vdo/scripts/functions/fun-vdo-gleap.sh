#!/bin/usr/env bash

# Add Gleap.
function add_gleap() {
  echo "Add Gleap";
  mkdir -p ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/modules/custom ;
  cp -r ${vdo_assets}/drupal/modules/varbase_gleap ${vdo_root}/${doc_name}/${PROJECT_NAME}/${distribution_webroot}/modules/custom/
}
