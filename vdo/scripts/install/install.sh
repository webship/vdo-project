#!/bin/usr/env bash

current_path=$(pwd);
user_name="$USER";

# Include Bash YAML library.
. ../libs/bash-yaml.sh

# Include Bash Progress Bar library.
. ../libs/progress-bar.sh

# Load VDO settings.
eval $(parse_yaml ../../config/vdo.settings.yml);


echo '*--------------------------------------------------*';
echo '*   Install VDO default configs                    *';
echo '*--------------------------------------------------*';

echo ' ' >> $HOME/.bashrc ;
echo '# *--------------------------------------------------*' >> $HOME/.bashrc ;
echo '# *  VDO default configs                             *' >> $HOME/.bashrc ;
echo '# *--------------------------------------------------*' >> $HOME/.bashrc ;

# ------------------------------------------------------------------------------
echo 'VDO Root working HTML';
echo '# VDO Root working HTML'>> $HOME/.bashrc ;

echo "${vdo_root}";
vdo_root=${vdo_root};
export vdo_root=${vdo_root} ;

printf "vdo_root="%s";\n" "$vdo_root" >> $HOME/.bashrc  ;
printf "export vdo_root="%s";\n" "$vdo_root" >> $HOME/.bashrc  ;

# ------------------------------------------------------------------------------
echo 'VDO path where we keep all Configs and scripts';
echo '# VDO path where we keep all Configs and scripts'>> $HOME/.bashrc ;
echo "${vdo_path}" ;
vdo_path=${vdo_path} ;
export vdo_path=${vdo_path} ;
printf "vdo_path="%s";\n" "$vdo_path" >> $HOME/.bashrc ;
printf "export vdo_path="%s";\n" "$vdo_path" >> $HOME/.bashrc ;

# ------------------------------------------------------------------------------
echo 'VDO Scripts';
echo '# VDO Scripts'>> $HOME/.bashrc ;
echo "${vdo_scripts}" ;
vdo_scripts=${vdo_scripts} ;
export vdo_scripts=${vdo_scripts} ;
printf "vdo_scripts="%s";\n" "$vdo_scripts" >> $HOME/.bashrc ;
printf "export vdo_scripts="%s";\n" "$vdo_scripts" >> $HOME/.bashrc ;

# ------------------------------------------------------------------------------
echo 'VDO Configs';
echo '# VDO Configs'>> $HOME/.bashrc ;
echo "${vdo_config}" ;
vdo_config=${vdo_config} ;
export vdo_config=${vdo_config} ;
printf "vdo_config="%s";\n" "$vdo_config" >> $HOME/.bashrc ;
printf "export vdo_config="%s";\n" "$vdo_config" >> $HOME/.bashrc ;
