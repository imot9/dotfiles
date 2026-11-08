local programs = {
    terminal    = "kitty",
    fileManager = "dolphin",
    menu        = "rofi -show drun",
}

local terminal    = programs.terminal
local fileManager = programs.fileManager
local menu        = programs.menu

local mainMod = "SUPER"

-- Monitor
hl.workspace_rule({ workspace = "name:1", monitor = "DP-1" })
hl.monitor({ output = "DP-1",     mode = "2560x1440@144.01Hz", position = "0x0", scale = 1 })

-- TV
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", default = true })

-- Basic
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- Movement
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Commands
hl.bind("Print",
    hl.dsp.exec_cmd("hyprshot -m window")
)
hl.bind("SHIFT + Print",
    hl.dsp.exec_cmd("hyprshot -m region")
)
hl.bind("SUPER + SHIFT + L",
    hl.dsp.exec_cmd("hyprlock")
)

hl.bind(mainMod .. " + SHIFT + V",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy")
)
hl.bind(mainMod .. " + SHIFT + X",
    hl.dsp.exec_cmd("cliphist wipe")
)

hl.bind(mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)
hl.bind(mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pamixer -i 5"),
    { repeating = true, locked = true }
)
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pamixer -u -d 5"),
    { repeating = true, locked = true }
)
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { repeating = true, locked = true }
)
hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { repeating = true, locked = true }
)
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl s 10%+"),
    { repeating = true, locked = true }
)
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl s 10%-"),
    { repeating = true, locked = true }
)
