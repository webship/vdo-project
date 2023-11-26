#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.demos.settings.yml);

# Set site version.
site_version="9.1.x-dev";

# Load distribution configs.
eval $(parse_yaml ${vdo_config}/distributions/varbase.yml);

ARGPARSE_DESCRIPTION="Build a ${distribution_title} ${site_version} project"
source ${vdo_scripts}/args/arg-vdo-${distribution_name}.sh || exit 1 ;

shift $#;

# Build the distribution.
build_distribution ;