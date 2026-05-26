-- hyprland.lua
-- Main configuration entry point.
-- Loads all modules from the modules/ directory using Lua's require().
-- Paths are relative to this file's location (~/.config/hypr/).
-- See: https://wiki.hypr.land/Configuring/Start/

require("modules.monitors")
require("modules.look-and-feel")
require("modules.windows")
require("modules.input")
require("modules.env-var")
require("modules.programs")
require("modules.binds")
