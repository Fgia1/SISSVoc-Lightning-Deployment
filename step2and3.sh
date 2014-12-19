#!/bin/bash
## STEP 2 & 3
echo -e "\n STEP 2 and 3"

cd sissvoc-package

# Install docker -- (This is the command for ubuntu linux)
 sudo apt-get install docker.io

# Install Git -- (This is the command for ubuntu linux)
 sudo apt-get install git

# Clone the docker-fuseki repo
 git clone https://github.com/CSIRO-enviro-informatics/docker-fuseki.git

echo -e "\n Please add your vocabulary's .ttl file in to the ..../docker-fuseki/config directory, you may have to open a new terminal to do this or drag and drop in the GUI line\n"
read -p "Press [enter] after you have this is done..."
ls

echo ${PWD##*/} ;
if [ ${PWD##*/} = "sissvoc-package" ]; then
	echo -e "\nCorrect dir, moving on...";
else 
	echo -e "\n We are in the wrong Dir, This means that you must have changed it...please change back to the /sissvoc-package dir and run the script again"; exit;
fi

#IMPORTANT You must edit the config.ttl file so that running Docker-fuseki will reflect your dataset. 

while true; do
    read -p "`echo $'\n\n '`IMPORTANT You must edit the config.ttl file so that running Docker-fuseki will reflect your dataset. The instructions can be found here`echo $'\n> '` https://github.com/CSIRO-enviro-informatics/sissvoc-package/wiki/How-to-deploy-a-SISSVoc-endpoint in step 2. `echo $'\n\n> '`Has this been done??? Otherwise I will redirect you now... (y = yes and n = no) : " yn
    case $yn in
        [Yy]* )  cd docker-fuseki; break;;
        [Nn]* ) cd docker-fuseki/config/; xdg-open config.ttl; cd ..;  true;;
        * ) echo "Please answer yes or no.  : ";;
    esac
done

ls

# build and run docker fuseki
 sudo bash ./build.sh
 sudo bash ./run.sh
 sudo bash ./run.sh

#display results of docker
 sudo docker ps

echo -e "\n That is the sudo docker ps"

echo -e "\n	http://localhost:3030/control-panel.tpl"

echo -e "\n The above link is the link to your SPARQL Endpoint, please finish off STEP 3 manually"

read -p "Press [enter] after you have this is done..."

cd ..
echo -e "\n\n Now moving on to STEP 4 \n\n You will be prompted for action.... "
bash step4.sh

