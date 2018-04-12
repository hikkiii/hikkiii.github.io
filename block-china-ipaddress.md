block chinese ip address
    
    获得中国所有ip地址
    link    https://segmentfault.com/q/1010000013588763
        新建一个shell
            vim getip.sh

            #!/bin/bash
            wget -c http://ftp.apnic.net/stats/apnic/delegated-apnic-latest
            cat delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | tee ~/chinaiplist.txt

        	chmod +x getip.sh
        	./getip.sh

	link    https://linux.cn/article-4904-1.html
	使用iptables之前，用IPset
    	debian系列安装:
        	sudo apt-get install ipset
    	创建新的ip集，名为iplist
        	sudo ipset create iplist hash:net
    	查看ip集
        	sudo ipset list
    	默认每个ip集最多65536个元素。可以调整大小
        	sudo ipset create iplist hash:net maxelem 1000000
    	增加IP块到这个集合中
        	语法如下
            	sudo ipset add iplist 1.1.1.1/32
            	sudo ipset add iplist 1.1.2.0/24
				sudo ipset add iplist 1.1.3.0/24
				sudo ipset add iplist 1.1.4.10/24 

    	但是列表很大很多。手工不现实。

    		vim批量导入
        	vim部分手册 
        		link    https://www.cnblogs.com/suzhengsheng/p/5020941.html
    
            	复制ip列表为脚本
    				cp ~/chinaiplist.txt ~/iplist.sh
    
    			用脚本导入ip进ip集合"iplist"
    				vim ~/iplist.sh
    				:.,$s/^/sudo ipset add iplist /
    				第一行加入#!/bin/bash
    				:wq!
    				chmod +x iplist.sh
    				./iplist.sh
    
			查看集合成员
    			sudo ipset list

		配置iptables
    	link    http://lesca.me/archives/iptables-tutorial-structures-configuratios-examples.html
    		清空原有配置
    			iptables -F 
    
    		屏蔽china所有ip
    			#注意。这一步做完后中国的所有ip都不能连接vps了
    			sudo iptables -I INPUT -m set --match-set iplist src -j DROP

    		使用非china ip连vps
    
        	添加白名单
            
            	查看需要通过的ip
                	0x1:在需要允许的客户端上用baidu搜索ip,返还的那个ip地址就是需要通过的
                	0x2:在vps中查看ss服务的链接ip
                	link    https://doub.io/ss-jc33/
            	添加放行ip
        			iptables -A INPUT -s ipaddress -j ACCEPT
        			iptables -A OUTPUT -s ipaddress -j ACCEPT





