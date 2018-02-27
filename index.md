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