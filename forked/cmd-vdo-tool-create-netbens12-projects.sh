#!/bin/usr/env bash

# Bootstrap VDO.
. ${vdo_scripts}/bootstrap.sh ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.forked.settings.yml);

sudo rm -rf ~/NetBeansProjects/${doc_name} ;
sudo mkdir ~/NetBeansProjects/${doc_name} ;
sudo chmod 777 -R ~/NetBeansProjects/${doc_name};
sudo chown www-data:${USER} -R ~/NetBeansProjects/${doc_name};

for dir_name in *; do
    if [[ -d "$dir_name" && ! -L "$dir_name" ]]; then

        sudo mkdir ~/NetBeansProjects/${doc_name}/${dir_name} ;
        sudo mkdir ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject ;
        sudo mkdir ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject/private ;
        sudo chmod 777 -R ~/NetBeansProjects/${doc_name}/${dir_name};
        sudo chown www-data:${USER} -R ~/NetBeansProjects/${doc_name}/${dir_name};

        type='';
        if [ -f "${vdo_root}/${doc_name}/${dir_name}/${dir_name}.info.yml" ]; then
            eval $(parse_yaml ${vdo_root}/${doc_name}/${dir_name}/${dir_name}.info.yml);
        fi

        ## --------------------------------------------------------------------------------
        ## ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject/private/private.properties
        echo "copy.src.files=false
copy.src.on.open=false
copy.src.target=${vdo_root}/${doc_name}/${dir_name}
index.file=
run.as=LOCAL
url=http://localhost/${doc_name}/${dir_name}/" > ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject/private/private.properties ;

        ## --------------------------------------------------------------------------------
        ## ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject/project.properties
        echo "include.path=\${php.global.include.path}
php.version=PHP_73
source.encoding=UTF-8
src.dir=../../../../../${vdo_root}/${doc_name}/${dir_name}
tags.asp=false
tags.short=false
web.root=." > ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject/project.properties ;

        ## --------------------------------------------------------------------------------
        ## ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject/project.xml
        echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<project xmlns=\"http://www.netbeans.org/ns/project/1\">
    <type>org.netbeans.modules.php.project</type>
    <configuration>
        <data xmlns=\"http://www.netbeans.org/ns/php-project/1\">
            <name>##${type} ${doc_name}:${dir_name}</name>
        </data>
    </configuration>
</project>" > ~/NetBeansProjects/${doc_name}/${dir_name}/nbproject/project.xml ;


    fi
done