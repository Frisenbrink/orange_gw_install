#!/bin/sh
UUID=$(cat /proc/sys/kernel/random/uuid)
INSTALL_PKGS="python3-pip default-jdk unzip avahi-daemon"
echo '**************************************'
echo 'Automagical Anura gateway setup.'
echo '**************************************'
echo 'Create temp install directory and cd into it.'
mkdir anurasetup
cd anurasetup
echo '**************************************'
echo 'Update and install packages'
echo '**************************************'
sudo apt-get update
echo 'Install apt packages defined in INSTALL_PKGS'
for i in $INSTALL_PKGS; do
  sudo apt-get install -y $i
done
echo '**************************************'
echo 'Apt packages installed.'
java -version
echo '**************************************'
echo '**************************************'
echo 'Install Boto3 pip'
pip3 install boto3
echo '**************************************'
echo 'Aws-cli installation.'
echo '**************************************'
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
echo '**************************************'
sudo ./aws/install
echo 'Aws-cli installed.'
echo '**************************************'
echo 'Setup AWS credentials.'
echo '**************************************'
echo 'Please input aws access key.'
read -p 'aws_access_key: ' aws_access_key
export AWS_ACCESS_KEY_ID=$aws_access_key
echo 'Please input secret access key'
read -p 'secret_access_key: ' secret_access_key
export AWS_SECRET_ACCESS_KEY=$secret_access_key
echo 'AWS credentials setup'
echo '**************************************'
echo 'Download and setup Greengrass software'
echo '**************************************'
curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-nucleus-latest.zip > greengrass-nucleus-latest.zip
unzip greengrass-nucleus-latest.zip -d GreengrassCore
echo 'Please input thing group.'
read -p 'thing_group: ' thing_group
echo 'Installing Greengrass.'
sudo -E java -Droot="/greengrass/v2" -Dlog.store=FILE -jar ./GreengrassCore/lib/Greengrass.jar --aws-region eu-central-1 --thing-name $UUID --thing-group-name $thing_group --thing-policy-name GreengrassCoreDevicePolicy --component-default-user ggc_user:ggc_group --provision true --setup-system-service true --deploy-dev-tools true
echo '**************************************'
echo 'Setup .bash_aliases.'
echo '**************************************'
cd ..
#wget https://gist.githubusercontent.com/Frisenbrink/e9543de27e49a38bd37c23f2f8afff6b/raw/cf3b7efe088f5ed18d2e7357489fda9b8dbfdfbc/.bash_aliases
sudo mv .bash_aliases /home/$USER/.bash_aliases
echo '**************************************'
echo 'Download motd.'
echo '**************************************'
#wget https://gist.githubusercontent.com/Frisenbrink/08234c269c7a5c81ca519802d2ec98b0/raw/b65a0b3e1d86fe7804199aee3cd6841f96d51bde/motd
sudo mv motd /etc/motd
echo 'Cleanup files.'
echo '**************************************'
echo 'Change permisssion of key'
echo '**************************************'
sudo chmod 644 /greengrass/v2/privKey.key
echo '**************************************'
echo 'Anura Gateway setup done!'
echo '**************************************'
exit