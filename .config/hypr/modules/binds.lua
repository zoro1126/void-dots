local ipc = "qs -c noctalia-shell ipc call"

hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal .. " -- sh -c 'fastfetch; exec fish'"))
local closeWindowBind = hl.bind("SUPER + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + F", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
-- hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))    -- dwindle only)

-- QS Commands --
hl.bind("SUPER + L", hl.dsp.exec_cmd("".. ipc .. " lockScreen lock"))
hl.bind("SUPER + A", hl.dsp.exec_cmd("".. ipc .. " sessionMenu toggle"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("".. ipc .. " launcher toggle"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("".. ipc .. " controlCenter toggle"))
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd("".. ipc .. " settings toggle"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("".. ipc .. " wallpaper toggle"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("pkill -f quickshell && qs -c noctalia-shell"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("".. ipc .. " plugin:workspace-overview toggle"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("".. ipc .. " desktopWidgets edit"))

-- Screenshots
hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -o ~/Pictures/Screenshots/ -m region"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows around
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with SUPER + [0-9]
-- Move active window to a workspace with SUPER + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })