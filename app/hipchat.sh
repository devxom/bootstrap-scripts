#!/usr/bin/env bash

if [[ `whoami` != 'root' ]]; then
  echo "Enter your user password so that "
  sudo -p "Password:" echo "Thank you!"
fi


cat << EOF > /etc/yum.repos.d/hipchat.repo
[atlassian-hipchat]
name=Atlassian Hipchat
baseurl=https://atlassian.artifactoryonline.com/atlassian/hipchat-yum-client/
enabled=1
gpgcheck=1
gpgkey=https://www.hipchat.com/keys/hipchat-linux.key
EOF

sudo dnf -y update
sudo dnf -y install hipchat4