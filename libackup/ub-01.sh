#!/bin/bash
sudo rm /etc/issue;sudo rm /etc/issue.net;sudo rm /etc/redhat-release;sudo rm /etc/motd 
#del some tip-file
sudo echo 1 > /proc/sys/net/ipv4/tcp_syncookies #TCP SYN Cookie protect

sudo apt update -y
sudo apt remove pump apmd isapnptools redhat-logos mt-st kernel-pcmcia-cs setserial redhat-release 
sudo apt remove eject linuxconf kudzu gd bc getty_ps raidtools pciutils mailcap setconsole gnupg samba* 
sudo apt install w3m links lynx zsh unzip jq net-tools vim goldendict -y
sudo apt remove cups -y
sudo userdel adm
sudo userdel lp
sudo userdel sync
sudo userdel shutdown
sudo userdel halt
sudo userdel news
sudo userdel uucp
sudo userdel operator
sudo userdel games
sudo userdel gopher
sudo groupdel adm
sudo groupdel lp
sudo groupdel news
sudo groupdel uucp
sudo groupdel games
sudo groupdel dip
sudo groupdel pppusers
sudo groupdel popusers
sudo groupdel slipusers
sudo chattr +i /etc/passwd
sudo chattr +i /etc/shadow
sudo chattr +i /etc/group
sudo chattr +i /etc/gshadow
sudo chattr +a /var/log
 
