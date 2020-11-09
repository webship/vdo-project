#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load the workspace settings extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

#==============================================================================#
# Full test varbase updater for all varbase versions.                          #
#==============================================================================#

#==============================================================================#
# Full test update all varbase 8.8.x to the latest
#==============================================================================#-
# But we recommend to use the basic composer update 
# ------------------------------------------------------------------------------
# Run 1 time.
# From 8.8.* to 8.8.5
# From 8.8.5 to 8.8.6
# From 8.8.* to 8.8.latest
# ------------------------------------------------------------------------------

. cmd-vdo-update-remove-all-varbase88x.sh
cd ${doc_path} ;
. cmd-vdo-update-build-all-varbase88x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase88x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase88x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase88x.sh
cd ${doc_path} ;


#==============================================================================#
# Full test update all varbase 8.7.x to the latest
#==============================================================================#
# Run 1 time.
# From 8.7.* to 8.8.4 
# From 8.8.4 to 8.8.5
# From 8.8.5 to 8.8.6
# From 8.8.* to 8.8.latest
# ------------------------------------------------------------------------------

. cmd-vdo-update-remove-all-varbase87x.sh
cd ${doc_path} ;
. cmd-vdo-update-build-all-varbase87x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase87x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase87x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase87x.sh
cd ${doc_path} ;


#==============================================================================#
# Full test update all varbase 8.6.x to the latest
#==============================================================================#
# Run 3 times. one from 8.6.* to 8.6.12
# From 8.6.* to 8.6.12
# From 8.6.12 to 8.7.0
# From 8.7.* to 8.8.4
# From 8.8.4 to 8.8.5
# From 8.8.5 to 8.8.6
# From 8.8.* to 8.8.latest
# ------------------------------------------------------------------------------

. cmd-vdo-update-remove-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-build-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-add-varbase-updater-to-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase86x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase86x.sh
cd ${doc_path} ;


#==============================================================================#
# Full test update all varbase 8.5.x to the latest
#==============================================================================#
# Run 5 times.
# From 8.5.* to 8.5.5
# From 8.5.5 to 8.6.3
# From 8.6.3 to 8.6.12
# From 8.6.12 to 8.7.0
# From 8.7.* to 8.8.4
# From 8.8.4 to 8.8.5
# From 8.8.5 to 8.8.6
# From 8.8.* to 8.8.latest
# ------------------------------------------------------------------------------

. cmd-vdo-update-remove-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-build-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-add-varbase-updater-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase85x.sh
cd ${doc_path} ;

#==============================================================================#
# Full test update all varbase 8.4.x to the latest
#==============================================================================#
# Run 5 times.
# From 8.4.* to 8.4.28
# From 8.4.28 to 8.6.3
# From 8.6.3 to 8.6.12
# From 8.6.12 to 8.7.0
# From 8.7.* to 8.8.4
# From 8.8.4 to 8.8.5
# From 8.8.5 to 8.8.6
# From 8.8.* to 8.8.latest
# ------------------------------------------------------------------------------

. cmd-vdo-update-remove-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-build-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-add-varbase-updater-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
. cmd-vdo-update-varbase-sh-to-all-varbase84x.sh
cd ${doc_path} ;
