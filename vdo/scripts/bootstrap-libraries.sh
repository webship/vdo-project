#!/bin/usr/env bash

# Include Bash YAML library.
source ${vdo_scripts}/libs/bash-yaml.sh || exit 1 ;

# Include the arguments parser
source ${vdo_scripts}/libs/argparse.sh || exit 1 ;

# Include Bash Progress Bar library.
source ${vdo_scripts}/libs/progress-bar.sh || exit 1 ;