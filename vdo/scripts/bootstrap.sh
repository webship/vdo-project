#!/bin/usr/env bash

current_path=$(pwd);
user_name="$USER";

# Include Bootstrap libraries.
source ${vdo_scripts}/bootstrap-libraries.sh || exit 1 ;

# Include Bootstrap functions.
source ${vdo_scripts}/bootstrap-functions.sh || exit 1 ;

# Load VDO settings.
eval $(parse_yaml ${vdo_config}/vdo.settings.yml);
