#install docker
sudo apt-get install -y docker
sudo yum install docker
other ways

#search 
sudo docker search v2ray

#pull
sudo docker pull v2ray/official

#run
...

#status
sudo docker container ls

#control
sudo docker container start/stop/restart v2ray

#rebuild
sudo docker container stop v2ray
sudo docker container rm v2ray
sudo docker run ......

#refer:
https://toutyrater.github.io/app/docker-deploy-v2ray.html


#search
sudo docker search nginx

#pull
sudo docker pull nginx

#run
sudo docker run -p 80:80 --name mynginx -v $PWD/www:/www -v $PWD/conf/nginx.conf:/etc/nginx/nginx.conf -v $PWD/logs:/wwwlogs  -d nginx  
#-p 80:80    docker_prot:80 --> host_port:80  
#--name  mynginx    name this docker
#-v $PWD/www:/www    ./www --> docker/www
#-v $PWD/conf/nginx.conf:/etc/nginx/nginx.conf    ./conf/nginx.conf --> docker/etc/nginx/nginx.conf
#-v $PWD/logs:/wwwlogs    ./logs --> docker/wwwlogs
