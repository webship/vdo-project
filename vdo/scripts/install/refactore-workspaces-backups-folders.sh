#!/bin/usr/env bash

echo '*--------------------------------------------------*';
echo '|   Refactore VDO workspaces backups folders       |';
echo '*--------------------------------------------------*';
echo ;
read -p "Are you sure? [Yes/No]" -n 1 -r
echo ;
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  exit 1;
fi

current_path=$(pwd);

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Delete old workspace backups.
for workspace_name in "${workspaces[@]}"
do
  sudo rm -rf ${vdo_backups}/${workspace_name};
  mkdir ${vdo_backups}/${workspace_name};
  printf "# %s Backups\n\nWe place our %s backups in this folder\n" "${workspace_name}" "${workspace_name}" >> ${vdo_backups}/${workspace_name}/README.md
done

