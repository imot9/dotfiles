hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & swaync & hypridle & hyprpaper")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("sleep 2 && ~/.config/scripts/background.sh")
    hl.dispatch(hl.dsp.focus({ workspace = 1 }))
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
