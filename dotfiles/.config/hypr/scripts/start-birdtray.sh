#!/bin/sh
# Start birdtray, but only once its dependencies are actually ready.
#
# birdtray needs QT_QPA_PLATFORM=xcb to be able to see Thunderbird's
# XWayland window (see toggle-thunderbird.sh), which means it needs a
# working XWayland connection. It also needs Qt's own tray-availability
# check to pass, which polls IsStatusNotifierHostRegistered on
# org.kde.StatusNotifierWatcher - true once waybar's tray module has fully
# initialized, which lags behind the watcher service merely existing on the
# bus. If birdtray starts before that property flips, it polls for 60s
# internally (see BirdtrayApp::ensureSystemTrayAvailable) and then exits
# with "the system tray can't be controlled by this addon", requiring a
# manual relaunch. Wait for the real signal ourselves, with a timeout so we
# never block forever if something is actually missing.

for i in $(seq 1 90); do
	xprop -root >/dev/null 2>&1 \
		&& [ "$(busctl --user get-property org.kde.StatusNotifierWatcher /StatusNotifierWatcher \
			org.kde.StatusNotifierWatcher IsStatusNotifierHostRegistered 2>/dev/null)" = "b true" ] \
		&& break
	sleep 1
done

export QT_QPA_PLATFORM=xcb
exec birdtray
