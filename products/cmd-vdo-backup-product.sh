#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.products.settings.yml);

# GET the Product name argument.
if [ "$1" != "" ]; then
    product_name=$1;
else
  echo "Please add the name of your product.";
  exit 1;
fi

tar -cvzf ${vdo_backups}/${doc_name}/product---${product_name}--$( date '+%Y-%m-%d_%H-%M-%S' ).tar.gz ${product_name} ;
