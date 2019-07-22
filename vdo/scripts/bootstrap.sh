#!/bin/usr/env bash

current_path=$(pwd);
user_name="$USER";

# Include Bash YAML library.
. ${vdo_scripts}/libs/bash-yaml.sh

# Include Bash Progress Bar library.
. ${vdo_scripts}/libs/progress-bar.sh

# Load VDO settings.
eval $(parse_yaml ${vdo_config}/vdo.settings.yml);
