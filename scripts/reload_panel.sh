#! /usr/bin/env bash
#########################################################################
# File Name: scripts/reload_panel.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月29日 星期日 18时42分13秒

# 此程序的功能是：
#########################################################################



# first, clear panel
herbstclient emit_hook quit_panel
pkill herbstclient

# find the panel
panel=~/.config/herbstluftwm/scripts/panel.sh
[ -x "$panel" ] || panel=/etc/xdg/herbstluftwm/panel.sh
for monitor in $(herbstclient list_monitors | cut -d: -f1) ; do
    # start it on each monitor
    "$panel" $monitor &
done
