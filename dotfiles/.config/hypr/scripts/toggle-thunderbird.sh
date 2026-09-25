#!/bin/sh
# Toggle Thunderbird's window via birdtray.
#
# birdtray's own "-t/--toggle-tb" flag is buggy (it doesn't check the
# window's real state, so repeated presses just re-hide it). We also can't
# trust `hyprctl clients` to tell us whether the window is shown or hidden:
# Hyprland doesn't reliably re-track an XWayland window that birdtray
# remaps after withdrawing it. So we ask X11 directly via WM_STATE, which
# birdtray does keep accurate.
#
# birdtray must run under the xcb (X11) Qt platform to see Thunderbird's
# XWayland window at all - see config/autostart.lua.

export QT_QPA_PLATFORM=xcb

window_id=""
for wid in $(xprop -root _NET_CLIENT_LIST 2>/dev/null | tr ',' '\n' | grep -oE '0x[0-9a-f]+'); do
	if xprop -id "$wid" WM_CLASS 2>/dev/null | grep -q "Thunderbird"; then
		window_id="$wid"
		break
	fi
done

if [ -n "$window_id" ] && xprop -id "$window_id" WM_STATE 2>/dev/null | grep -q "Normal"; then
	birdtray --hide-tb
else
	birdtray --show-tb
fi
