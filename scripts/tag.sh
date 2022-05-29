#! /usr/bin/env bash
#########################################################################
# File Name: scripts/tag.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月29日 星期日 21时49分31秒

# 此程序的功能是：
#########################################################################




framenum=`herbstclient attr tags.focus.frame_count`
windownum=`herbstclient attr tags.focus.client_count`
if [ $windownum = 0 ] && [ $framenum = 1 ] ; then
	herbstclient set frame_transparent_width 0
else
	herbstclient set frame_transparent_width `herbstclient get window_border_width`
fi

