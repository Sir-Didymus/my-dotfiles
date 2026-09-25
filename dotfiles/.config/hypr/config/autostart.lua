-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  -- birdtray must run under X11 (xcb) to be able to see/hide Thunderbird's
  -- XWayland window at all; native-Wayland birdtray can't enumerate it
  hl.exec_cmd("env QT_QPA_PLATFORM=xcb birdtray")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("sh -c 'sleep 1 && awww img ~/.config/wallpapers/ukiyo-e-1-cropped.jpg --resize crop'")
end)
