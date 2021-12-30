#!/bin/usr/env bash

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.test.settings.yml);

# Set the version.
site_version="1.0.x-dev";

# Load distribution configs.
eval $(parse_yaml ${vdo_config}/distributions/webships.yml);

ARGPARSE_DESCRIPTION="Build a ${distribution_title} ${site_version} project"
source ${vdo_scripts}/args/arg-vdo-${distribution_name}.sh || exit 1 ;

shift $#;

# Build the distribution.
build_distribution ;
