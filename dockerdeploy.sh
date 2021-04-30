#!/bin/bash

#_____________________________________________________________________________________________________________
#                                                   HEADER
#_____________________________________________________________________________________________________________

#Set start timer (approximate, not sub-second)
start=`date +%s`

#Banner
echo -e "
\e[35m _______              _                                          _      
\e[35m|__   __|            | |                                        (_)     
\e[35m   | | ___  _ __ ___ | |     __ ___      _____  ___  _ __        _  ___ 
\e[35m   | |/ _ \| '_   _ \| |    / _  \ \ /\ / / __|/ _ \| '_ \      | |/ _ \ 
\e[35m   | | (_) | | | | | | |___| (_| |\ V  V /\__ \ (_) | | | |  _  | | (_) |
\e[35m   |_|\___/|_| |_| |_|______\__,_| \_/\_/ |___/\___/|_| |_| (_) |_|\___/ 
 
           \e[33m                  [ Docker Deploy ]                  \e[0m"

echo -e "\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;37m\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_"    
echo -e "\e[0             \e[0;37m+                                                                         "
echo -e "                                                                                                   "
echo -e "                     * \e[0m                                                                       "
echo -e "        \e[0;93m                   .--. \e[0;37m     \"Primitive life is very common and      \e[0m"
echo -e "        \e[0;93m                 / /    \e[0;37m      intelligent life is fairly rare.        \e[0m"
echo -e "        \e[0;93m                | |     \e[0;37m                                              \e[0m"
echo -e "        \e[0;93m                 \ \__, \e[0;37m      Some would say it has                   \e[0m"
echo -e "        \e[0;93m                   --   \e[0;37m      yet to occur on Earth.\"                \e[0m"
echo -e "                   __                                                                              "
echo -e "\e[0;37m               +\e[0m  /  \     \e[0;37m                       ― Stephen W. Hawking   \e[0m"
echo -e "                 /    \  \e[0;37m * \e[0m                                                          "
echo -e "\e[0;37m         *  \e[0m    /======\      \e[0;37m+\e[0m                                          "
echo -e "               ;:.  _   ;                                                                          "
echo -e "               |:. (_)  |                                                                          "
echo -e "               |:.  _   |                                                                          "
echo -e "\e[0;37m     +\e[0m         |:. (_)  | \e[0;37m         *  \e[0m                                   "
echo -e "               ;:.      ;                                                                          "
echo -e "              /  \:.  /  \.                                                                        "
echo -e "             / .- .__. -.,\                                                                        "
echo -e "            |/    \e[33m/||\ \e[0m   \|                                                            "
echo -e "\e[32m          _..--+++****+++--.._                                                               "
echo -e "  _.-++++++++++++++++++++++++++ -._ \e[0m                                                          "

echo -e "\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;37m\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_"

#_____________________________________________________________________________________________________________
#                                                   SCRIPT
#_____________________________________________________________________________________________________________
apt-get install wget -y
wait
echo "wget installed"
wait

PACKAGES="`wget -qO- https://raw.githubusercontent.com/tomlawesome/dockerdeploy/main/installed_packages?token=ASHJLHDUAHTADRWUXLN4XW3AOCSFI`"
wait 
echo "PACKAGE LIST OBTAINED"

apt-get update -y && apt-get upgrade -y
wait
echo "System updated && upgraded"

apt-get install $PACKAGES -y
wait
echo "Packages installed"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
wait
echo "Added GPG key to keyring"

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
wait
echo "Added docker repo to list"

apt-get update -y && apt-get install docker-ce docker-ce-cli containerd.io -y
wait
echo "Docker installed"
docker -v

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
wait
echo "Compose Downloaded"

ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
wait
echo "Symlink created"

echo -e "\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;37m\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_"
docker -v
docker-compose -v
echo -e "\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;37m\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_"


#_____________________________________________________________________________________________________________
#                                                   FOOTER
#_____________________________________________________________________________________________________________

# Mark end of script and calc runtime
wait
end=`date +%s`
runtime=$((end-start))

echo -e "\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;37m\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_"
echo -e "     \e[37m      /           \e[33mDocker Deploy       \e[37m/ \e[0m
          \e[37m          Finished in: \e[32m$runtime \e[37mseconds     \n \e[0m"
echo -e "\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_\e[0;37m_\e[0;93m_\e[0;37m\e[0;93m_\e[0;31m_\e[0;32m_\e[0;33m_\e[0;34m_\e[0;35m_\e[0;36m_"


# Visual spacer for terminal & reset colour
echo -e "\e[0m"

# Sign off mixed
echo -e "                         \e[0;37mCheers then\e[0m"
echo -e "                             \e[0;33mT\e[0;34mo\e[0;35mm\e[0m"