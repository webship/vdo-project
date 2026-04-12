#!/bin/usr/env bash

# Change file permissions and ownership
function set_chmod() {
  chmod 775 -R ${vdo_root}/${doc_name}/${PROJECT_NAME} ;
}

# Change file permissions and ownership
function set_chown() {
  echo "Skipping chown - DDEV handles file ownership.";
}

# Securing file permissions and ownership.
function set_chmod_chown() {
  echo "Skipping chmod/chown - DDEV handles file permissions and ownership.";
}

