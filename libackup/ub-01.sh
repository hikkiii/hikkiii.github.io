#!/bin/bash
sudo rm /etc/issue;sudo rm /etc/issue.net;sudo rm /etc/redhat-release;sudo rm /etc/motd 
#del some tip-file

sudo echo 0.0.0.0 api.map.baidu.com >> /etc/hosts
sudo echo 0.0.0.0 ps.map.baidu.com >> /etc/hosts 
sudo echo 0.0.0.0 sv.map.baidu.com >> /etc/hosts
sudo echo 0.0.0.0 offnavi.map.baidu.com >> /etc/hosts
sudo echo 0.0.0.0 newvector.map.baidu.com >> /etc/hosts
sudo echo 0.0.0.0 ulog.imap.baidu.com >> /etc/hosts
sudo echo 0.0.0.0 newloc.map.n.shifen.com >> /etc/hosts
sudo echo :: api.map.baidu.com >> /etc/hosts
sudo echo :: ps.map.baidu.com >> /etc/hosts
sudo echo :: sv.map.baidu.com >> /etc/hosts
sudo echo :: offnavi.map.baidu.com >> /etc/hosts
sudo echo :: newvector.map.baidu.com >> /etc/hosts
sudo echo :: ulog.imap.baidu.com >> /etc/hosts
sudo echo :: newloc.map.n.shifen.com >> /etc/hosts

sudo echo 1 > /proc/sys/net/ipv4/tcp_syncookies #TCP SYN Cookie protect
#不能写入,权限问题,所属是root.暂未想到不用su的方法.

sudo apt update -y
sudo apt remove pump apmd isapnptools redhat-logos mt-st kernel-pcmcia-cs setserial redhat-release 
sudo apt remove eject linuxconf kudzu gd bc getty_ps raidtools pciutils mailcap setconsole gnupg samba* 
sudo apt install w3m links lynx zsh unzip jq net-tools vim goldendict evolution -y
sudo apt remove cups -y
sudo rm /etc/init.d/cups*
sudo rm /usr/sbin/cups*
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

sudo rm /etc/init.d/anacron
sudo rm /etc/init.d/auditd
sudo rm /etc/init.d/autofs
sudo rm /etc/init.d/avahi-daemon
sudo rm /etc/init.d/avahi-dnsconfd
sudo rm /etc/init.d/bluetooth
sudo rm /etc/init.d/cpuspeed
sudo rm /etc/init.d/firstboot
sudo rm /etc/init.d/gpm
sudo rm /etc/init.d/haldaemon
sudo rm /etc/init.d/hidd
sudo rm /etc/init.d/ip6tables
sudo rm /etc/init.d/ipsec
sudo rm /etc/init.d/isdn
sudo rm /etc/init.d/lpd
sudo rm /etc/init.d/mcstrans
sudo rm /etc/init.d/messagebus
sudo rm /etc/init.d/netfs
sudo rm /etc/init.d/nfs
sudo rm /etc/init.d/nfslock
sudo rm /etc/init.d/nscd
sudo rm /etc/init.d/pcscd 
sudo rm /etc/init.d/portmap
sudo rm /etc/init.d/readahead_early
sudo rm /etc/init.d/restorecond
sudo rm /etc/init.d/rpcgssd
sudo rm /etc/init.d/rpcidmapd
sudo rm /etc/init.d/rstatd
sudo rm /etc/init.d/sendmail
sudo rm /etc/init.d/setroubleshoot
sudo rm /etc/init.d/yppasswdd 
sudo rm /etc/init.d/ypserv

sudo chattr +i /etc/passwd
sudo chattr +i /etc/shadow
sudo chattr +i /etc/group
sudo chattr +i /etc/gshadow
sudo chattr +a /var/log

sudo ufw enable 
sudo ufw allow 80
sudo ufw allow 443
sudo ufw deny 5353
sudo ufw deny 68
sudo ufw deny 631

sudo service avahi-daemon stop
sudo apt remove avahi-daemon
sudo apt remove cup*
