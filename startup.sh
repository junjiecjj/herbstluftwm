#! /usr/bin/env bash
#########################################################################
# File Name: startup.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月29日 星期日 22时06分19秒

# 此程序的功能是：
#########################################################################




#=======================================================================================
#====   自启动服务程序  ==================
#=======================================================================================

killall -9 picom sxhkd dunst nm-applet redshift   xfce4-power-manager


# 启动Compositor,主要用于一些特殊效果，如透明背景，阴影等
# 这里还可以增加一些自启动的程序，比如我还增加了fcitx


# background
feh --recursive --randomize --bg-fill   $(xdg-user-dir PICTURES)'/Wallpapers/'


# picom  X
# 启用窗口透明
# picom --config ~/.config/picom/picom_NoblurRoundBrokenCorner.conf -b

##  TopBar
# xmobar  ~/.xmonad/xmobar/xmobarrc.hs  &
# xmobar  ~/.config/bspwm/xmobarrc.hs  &

# input method
# fcitx  &
# fcitx5 &

#
# dunst &

#   screenlock
# sh   ~/.fehbg
# Screensaver 锁屏工具
# xautolock -time 10 -locker '/usr/bin/betterlockscreen -l' -corners ---- -cornersize 30 &
# xscreensaver -no-splash &


# # Redshift 护眼工具
# redshift &


# # 剪切板管理器
# copyq &
# xfce4-power-manager &

# # 坚果云
# nutstore &

# # Network Applet用于显示网络托盘图标，
# nm-applet &
# # blue Applet蓝牙系统托盘
# blueman-applet &



# # 火焰截图
# nohup flameshot >/dev/null 2>&1  &


feh --recursive --randomize --bg-fill   $(xdg-user-dir PICTURES)'/Wallpapers/'
# feh --recursive  --bg-fill $(xdg-user-dir PICTURES)'/Wallpapers/background.jpg'


# Power manager
if [ -z "$(pgrep xfce4-power-manager)" ] ; then
    xfce4-power-manager &
fi




# Network Applet用于显示网络托盘图标，
if [ -z "$(pgrep nm-applet)" ] ; then
    nm-applet &
fi


# blue Applet蓝牙系统托盘
if [ -z "$(pgrep blueman-applet)" ] ; then
    blueman-applet &
fi

# Screensaver 锁屏工具
if [ -z "$(pgrep xscreensaver)" ] ; then
    xscreensaver -no-splash &
fi


# Redshift 护眼工具
killall  redshift
if [ -z "$(pgrep redshift)" ] ; then
    # redshift-gtk &
    red 4000
fi


# 启用窗口透明
if [ -z "$(pgrep picom)" ] ; then
    picom --experimental-backends -b
fi


# 火焰截图
if [ -z "$(pgrep   flameshot)" ] ; then
    nohup flameshot >/dev/null 2>&1  &
fi


# 桌面通知
if [ -z "$(pgrep   dunst)" ] ; then
    dunst &
fi



# 剪切板管理器
if [ -z "$(pgrep  copyq )" ] ; then
    copyq &
fi



# 开启小键盘
if [ -z "$(pgrep   numlockx)" ] ; then
   numlockx on
fi


if [ -z "$(pgrep  fcitx )" ] ; then
    fcitx   &
    fcitx5   &
fi



#音频相关的托盘
if [ -z "$(pgrep  pasystray )" ] ; then
     nohup   pasystray     >  /dev/null  2>&1 &
fi


if [ -z "$(pgrep  kmix )" ] ; then
     nohup   kmix     >  /dev/null  2>&1 &
fi


if [ -z "$(pgrep  pa-applet )" ] ; then
     nohup   /foo/bar/bin/pa-applet       >  /dev/null  2>&1 &
fi

if [ -z "$(pgrep  mictray )" ] ; then
     nohup   mictray       >  /dev/null  2>&1 &
fi


#  xautolock锁屏工具
if [ -z "$(pgrep  xautolock)" ] ; then
     xautolock -time 30 -locker '/usr/bin/betterlockscreen -l'   -corners +000 -cornersize 5 -cornerdelay 5 -cornerredelay 180 &
     sh   ~/.fehbg
fi



# System tray
if [ -z "$(pgrep trayer)" ] ; then
    trayer --edge top --align right --widthtype percent --width 10 --heighttype pixel --height 22  --SetPartialStrut true --transparent true --alpha 60 --tint 0x777777 --expand true
fi


# if [ -z "$(pgrep stalonetray)" ] ; then
#     # stalonetray  -geometry  "10x1-0+0" -bg "#777777" --icon-size 17 --transparent false --sticky true --window-layer "bottom"  &
#     stalonetray  -geometry  "10x1-0+0" -bg "#777777" --icon-size 16 --transparent false --sticky true --window-layer "bottom" --grow-gravity  NW  --icon-gravity NW  --max-geometry 0x0 --scrollbars none --sticky  true  --window-type  dock
# fi



