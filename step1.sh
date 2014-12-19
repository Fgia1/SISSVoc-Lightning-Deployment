#!/bin/bash
## STEP 1
# Desploy Sissvoc
echo -e "\n STEP 1 - Deploy SISSVoc "
echo -e "\n We will check all your pre-reqs and install them if required"

# Install Maven 
sudo apt-get install mvn

# Install Curl
sudo apt-get install curl

# install Python 2.7+
sudo apt-get install python

# install bash
sudo apt-get install bash

# install sed
sudo apt-get install sed

# install openjdl-7
sudo apt-get install openjdk-7-jdk

#clone the sissvoc-package-master
git clone https://github.com/Fgia1/sissvoc-package.git

cd sissvoc-package
bash package-sissvoc-vanilla.sh

cd ..


while true; do
    read -p "`echo $'\n\n '`Would you like to proceed with STEP 2??`echo $'\n> '` .... (y = yes and n = no) - " yn
    case $yn in
        [Yy]* )  bash step2and3.sh ; break;;
        [Nn]* )  exit;;
        * ) echo "Please answer yes or no.  : ";;
    esac
done
