hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

hl.monitor({
    output   = "DP-2",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
    mirror = "eDP-1"
})

