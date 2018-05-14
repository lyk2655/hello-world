---
layout: default
---

# Ubuntu 笔记

### Mybatis错误：Parameter 'XXX' not found. Available parameters are [1, 0, param1, param2]
```
 <select id="queryLineByLine" parameterType="java.lang.String" resultType="Line">
        select * from bus_line where line_id=#{line}
 </select>
```
加了个条件stanum就报错
```
    <select id="queryLineByLineAndStanum" parameterType="java.lang.String" resultType="Line">
        select * from bus_line where line_id=#{line} and line_stanum=#{stanum}
    </select>
```
改成
```
    <select id="queryLineByLineAndStanum" parameterType="java.lang.String" resultType="Line">
        select * from bus_line where line_id=#{0} and line_stanum=#{1}
    </select>
```
正常查询成功！

### 查看端口和进程
```
查看端口哪个进程占用：lsof -i:8080
查看端口： netstat -an | grep 8080
```


### 展示最近n次提交记录
`git log -p -n`

### github 添加链接
```
<a href="https://zh.wikipedia.org/wiki/Markdown" target="_blank"> [ 维基百科 ]
```
< a href="www.baidu.com" > [ 百度 ]
```
本项目链接
[ 显示图片 ](./docs/beautiful.md)
```
[ 显示图片 ](./docs/beautiful.md)

![beautiful](https://github.com/lyk2655/hello-world/raw/master/docs/beautiful.md)

### github 添加图片
`![beautiful](https://github.com/lyk2655/hello-world/raw/master/img/beautiful.jpg)`

### sublime text3 不支持中文输入
```
sudo apt-get update && sudo apt-get upgrade

git clone https://github.com/lyfeyaj/sublime-text-imfix.git

cd sublime-text-imfix

./sublime-imfix
重启sublime就可以啦
```

### 安装system monitor： CPU 内存 网络监控
```
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor

安装完执行 indicator-sysmonitor &
然后设置为开机启动就可以啦
```

### Ubuntu自定义终端窗口位置
在终端使用 `xwininfo` 命令，获取屏幕位置：
```
linyk3@ThinkPad-S5:~$ xwininfo

xwininfo: Please select the window about which you
          would like information by clicking the
          mouse in that window.

xwininfo: Window id: 0x4c00602 "linyk3@ThinkPad-S5: ~"

  Absolute upper-left X:  992
  Absolute upper-left Y:  52
  Relative upper-left X:  0
  Relative upper-left Y:  0
  Width: 928
  Height: 1028
  Depth: 32
  Visual: 0x9f
  Visual Class: TrueColor
  Border width: 0
  Class: InputOutput
  Colormap: 0x4c00009 (not installed)
  Bit Gravity State: NorthWestGravity
  Window Gravity State: NorthWestGravity
  Backing Store State: NotUseful
  Save Under State: no
  Map State: IsViewable
  Override Redirect State: no
  Corners:  +992+52  -0+52  -0-0  +992-0
  -geometry 101x60--10--10

linyk3@ThinkPad-S5:~$ 

```
我们需要关注的是上图中的最后一行： 101x60--10--10，其中110x60指的是窗口的 长度和宽度，注意"x"是英文字母x，其中的--10--10是窗口的x坐标和y坐标。

获得了窗口位置参数之后，然后在Ubuntu的系统设置 --> 键盘 --> 快捷键 --> 自定义快捷键中添加一个命令:
名称：`my-terminal`
命令：`gnome-terminal --geometry 101x60--10--10`
点击“禁用”那里，系统会提示“新建加速键”，我们按一下自己需要的快捷键就好（注意不要冲突）。到此为止，设置结束，之后随时可以按快捷键来在目标位置启动终端窗口。


### 决小键盘数字键盘不能开机自动启动的问题

安装 numlockx：
`sudo apt-get install numlockx`

然后编辑 `sudo gedit /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf`

在最后添加：`greeter-setup-script=/usr/bin/numlockx on`

### Sping in action 4th 源码 
`https://www.manning.com/books/spring-in-action-fourth-edition`


### 双系统，Ubuntu 不能打开windows数据盘
```
Error mounting /dev/sda4 at /media/xxx: Command-line `mount -t "ntfs" -o "uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000" "/dev/sda4" "/media/linyk3/软件工程"' exited with non-zero exit status 14: The disk contains an unclean file system (0, 0).
Metadata kept in Windows cache, refused to mount.
Failed to mount '/dev/sda4': 不允许的操作
The NTFS partition is in an unsafe state. Please resume and shutdown
Windows fully (no hibernation or fast restarting), or mount the volume
read-only with the 'ro' mount option.
```
原因：上一次使用win10后使电脑睡眠，没有完全关机，这次开机直接进入ubuntu系统，访问win10磁盘报错。
解决方法：
1 查看盘符
`sudo fdisk -l`
2 修复挂载错误的分区，这里我需要修复的是 /sda5
`sudo ntfsfix /dev/sda5`

### git push时保存用户名密码
`git config --global credential.helper store`

### 为命令设置别名
`alias`
重启后有效： 更新`~/.bashrc`

### Ubuntu 安装截图软件deepin-scrot, 类似QQ截图
`$sudo dpkg -i deepin-scrot_2.0-0deepin_all.deb`
如果缺少依赖，直接执行：
`$sudo apt-get install -f`
然后设置快捷方式启动 deepin-scrot 即可。
执行时如果提示找不到模块gtk，
```
linyk3@ThinkPad-S5:~$ deepin-scrot
Traceback (most recent call last):
  File "./deepinScrot.py", line 24, in <module>
    import gtk, os, sys, time
ImportError: No module named gtk
```
可以执尝试安装 Python-gtk2
`$sudo apt-get install  python-gtk2`

### Ubuntu 关闭显示器 
`xset dpms force off`
重命名命令：
`alias poff='xset dpms force off'`


### 云服务器
`111.230.148.118`
`47.106.81.77`

### Ubuntu 乱码
`sudo apt-get install language-pack-zh-hans`


### Ubuntu 安装 redis 
 -`sudo tar -zxvf redis-3.2.6.tar.gz`
 -`tar -zxvf redis-3.2.6.tar.gz`
 -` sudo mkdir /usr/redis`
 -`sudo mv redis-3.2.6 /usr/redis/`
 -`cd /usr/redis/redis-3.2.6/`
 -`sudo make`
 -`sudo make install`
 -`sudo mkdir /etc/redis`
 -`sudo cp redis.conf /etc/redis/`
 -`sudo vi /etc/redis/redis.conf` daemonize no  => daemonize  yes
 - `cd /usr/local/bin/`
 -`redis-server /etc/redis/redis.conf`
 -`redis-cli -p 6379`
 -`ping` => PONG


### Ubuntu redis 报错 
报错信息：MISCONF Redis is configured to save RDB snapshots, but is currently not able to persist on disk. Commands that may modify the data set are disabled. Please check Redis logs for details about the error.
解决方法：
进入redis: `$./redis-cli`
执行：`> config set stop-writes-on-bgsave-error no`

### 编译maven项目 
`mvn clean package -Dmaven.test.skip=true`
`java -jar app.jar`







### Ubuntu 16.04 无法应用原保存的显示器配置 
开机错误信息：无法应用原保存的显示器配置， 
第 1 行第 1 个字符出错： 文档必须以一个元素开始(例如 <book>)
解决方法：`$rm ~/.config/monitor.xml`

### 卡住不动 0% [正在连接 cn.archive.ubuntu.com (2001:67c:1562::19)] 
Ubuntu 强制使用ipv6导致 使用下面方法
打开/etc/gai.conf(地址信息的配置文件），
找到＃precedence ::ffff:0:0/96  100，　将"#" 去掉保存，就行了。

### Ubuntu 编辑模式下，上下左右键显示字母A B C D
卸载vi，重新安装vim
```
$sudo apt-get remove vim-common
$sudo apt-get install vim
```
