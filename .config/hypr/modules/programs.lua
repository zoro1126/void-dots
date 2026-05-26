terminal = "kitty"
fileManager = "nautilus"
browser = "firefox"


-- AUTO START
hl.on("hyprland.start", function ()
  -- Export critical Wayland + Hyprland env vars to systemd user session AND dbus.
  -- This must happen before launching quickshell/noctalia-shell so it can detect
  -- Hyprland via HYPRLAND_INSTANCE_SIGNATURE and use the correct spawn backend.
  hl.exec_cmd("sh -c 'systemctl --user import-environment WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP DISPLAY XAUTHORITY; dbus-update-activation-environment --systemd WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP DISPLAY XAUTHORITY'")
  hl.exec_cmd("qs -c noctalia-shell")
end)