useradd test
passwd test

/etc/ssh/sshd_config

port  xxxx
MaxAuthTries 5
AllowUsers test
PermitEmptyPasswords no
PermitRootLogin no
X11Forwarding no
UseDNS no

service sshd restart

userdel adm
userdel lp
userdel sync
userdel shutdown
userdel halt
userdel news
userdel uucp
userdel operator
userdel games
userdel gopher
userdel ftp
groupdel adm
groupdel lp
groupdel news
groupdel uucp
groupdel games
groupdel dip
groupdel pppusers
groupdel popusers 
groupdel slipusers

rm /etc/issue
rm /etc/issue.net
rm /etc/redhat-release
rm /etc/motd

chattr +i /etc/passwd		
chattr +i /etc/shadow
chattr +i /etc/group
chattr +i /etc/gshadow
chattr +a /var/log  

echo 1 > /proc/sys/net/ipv4/tcp_syncookies   #TCP SYN Cookie protect

/etc/modprobe.d/dist.conf	(/etc/modprobe.conf)
#add 
alias net-pf-10 off
alias ipv6 off    #restart save

iptables -L  #see
iptables -F
iptables -X
iptables -Z  #reset

/etc/hosts

0.0.0.0 api.map.baidu.com 
0.0.0.0 ps.map.baidu.com 
0.0.0.0 sv.map.baidu.com 
0.0.0.0 offnavi.map.baidu.com 
0.0.0.0 newvector.map.baidu.com 
0.0.0.0 ulog.imap.baidu.com 
0.0.0.0 newloc.map.n.shifen.com 
:: api.map.baidu.com 
:: ps.map.baidu.com 
:: sv.map.baidu.com 
:: offnavi.map.baidu.com 
:: newvector.map.baidu.com 
:: ulog.imap.baidu.com 
:: newloc.map.n.shifen.com

https://www.cnblogs.com/MYSQLZOUQI/p/5317916.html
