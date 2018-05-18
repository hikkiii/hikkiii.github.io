flag在index里
点进去后感觉是文件包含
http://120.24.86.145:8005/post/index.php?file=show.php
然后各种尝试0.0 后来看别人wp才知道包含的是index.php ...
然后直接file=index.php 有几万个节点.展开直接卡死.看wp才知道要用php://filter 过滤查看
file=php://filter/read=convert.base64-encode/resource=index.php


前女友
php源码
get参数v1 v2 v3
v1!=v2 && md5(v1)==md5(v2)
php的md5漏洞 0e开头的md5值都会解析成0
strcmp php5.3之前有漏洞
用== 时 不同类型的值可能会返还0
?v1=QNKCDZO&v2=s878926199a&v3[]=1
strcmp漏洞利用时要注意用数组.. v3[]=1
get请求的构造 
    .php?变量1=xxx&变量2=xxx&变量3=xxx



login1(SKCTF)

SQL约束攻击
注册时
admin                    1
passwd
这个用户名和密码 
会在执行SQL时,只读取前面的。实际上注册的是admin很多空格1
但是登陆时
输入admin
密码可以是原来的admin密码
也可以是新注册的admin很多空格1 的密码
