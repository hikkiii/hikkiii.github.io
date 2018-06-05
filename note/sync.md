#参考
http://www.admpub.com/blog/post-244.html
https://www.appinn.com/syncthing/

#Download 
https://syncthing.net

#run 
./syncthing

#config 
#0x1
~./config/syncthing/config.xml
#0x2
localhost:8384

#开启端口映射
ssh -L 9999:localhost:8384 user@server -p 22
#访问server上的Syncthing的WEB GUI界面
http://127.0.0.1:9999

#添加同步设备
web GUI界面添加.然后确认
 
