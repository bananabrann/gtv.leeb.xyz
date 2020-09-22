# This script looks to install and setup the Raspberry Pi to run automatically
# on startup. This script should be executed only once.
# NOTE - THIS HAS NOT BEEN TESTED.



# Gets full path of where the script is located.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
sudo apt-get update

# NOTE - This process to install Docker follows the baseline from the docs.
# https://docs.docker.com/engine/install/ubuntu

# SECTION - Set Up Docker Repository
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# SECTION - Install Docker Engine
sudo apt-get install docker-ce docker-ce-cli containerd.io

# SECTION - Set Up Auto Build
if [ ! -f ~/.bashrc ]; then
    echo ".bashrc not found, creating it..."
    touch ~/.bashrc
fi

echo "bash $DIR/run.sh" >> ~/.bashrc

# SECTION - Say by and reboot
clear
echo "Complete! Restarting in 5 seconds..."
sleep 5
shutdown -r now