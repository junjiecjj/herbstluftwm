#! /usr/bin/env bash
#########################################################################
# File Name: scripts/pad.sh
# Author:陈俊杰
# mail: 2716705056@qq.com
# Created Time: 2022年05月29日 星期日 17时58分18秒

# 此程序的功能是：
#########################################################################




hc() {
    herbstclient "$@"
}

get_profile() {
  width=$3
  height=$4
  fn="$HOME/.config/herbstluftwm/monitor.d/${width}x${height}.sh"
  [ -f "${fn}" ] && echo "${fn}" || return 1
}

for monitor in $(hc list_monitors | cut -d: -f1) ; do
  fn=$(get_profile $(hc monitor_rect ${monitor}))
  if [[ -n ${fn} ]]; then
    hc lock
    hc focus_monitor $monitor
    source "${fn}"
    #  pad MONITOR [PADUP [PADRIGHT [PADDOWN [PADLEFT]]]]
    hc pad $monitor $pad_up $pad_right $pad_down $pad_left
    hc unlock
  fi
done
