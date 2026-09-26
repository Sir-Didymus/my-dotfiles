------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Desktop layout (mirrors the old autorandr "desktop-pc" profile):
--   left  = BenQ GL2450H  (HDMI-A-1) 1920x1080 @ 0x0
--   right = Dell U2415    (DP-2)     1920x1200 @ 1920x0
-- Monitors are matched by EDID description instead of connector name, so the
-- layout survives the connector renaming that happened moving from X11/autorandr
-- (DisplayPort-1 / HDMI-A-0) to Wayland (DP-2 / HDMI-A-1).
local Monitors = {
  right = "desc:Dell Inc. DELL U2415 XKV0P9C32D4S",
  left = "desc:BNQ BenQ GL2450H D1F03140019",
}

-- Fallback for any monitor that isn't one of the two below.
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1,
})

hl.monitor({
  output = Monitors.left,
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = Monitors.right,
  mode = "1920x1200@59.95",
  position = "1920x0",
  scale = 1,
})

-------------------------------
---- WORKSPACE ASSIGNMENTS ----
-------------------------------

-- Like the i3 config: workspaces 1-10 live on the right monitor, 11-20 on the
-- left one. When a monitor is missing, Hyprland falls back to the active one,
-- so on a single-monitor setup every workspace simply opens there.
for i = 1, 10 do
  hl.workspace_rule({
    workspace = tostring(i),
    monitor = Monitors.right,
    default = i == 1,
  })
end

for i = 11, 20 do
  hl.workspace_rule({
    workspace = tostring(i),
    monitor = Monitors.left,
    default = i == 11,
  })
end
