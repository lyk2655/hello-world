---
layout: default
---

# Ubuntu 笔记

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
![](https://assets-cdn.github.com/images/2018-02-27001.png)
