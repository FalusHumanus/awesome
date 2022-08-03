----------------------
-- awesomeWM config --
-- @FalusHumanus    --
----------------------

local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type
--https://awesomewm.org/doc/api/documentation/05-awesomerc.md.html
local beautiful = require("beautiful")
local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
              require("awful.autofocus")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local freedesktop = require("freedesktop")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


--[[ {{{ Autostart windowless processes
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ " ", " " })
-- }}} ]]

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

------------
-- Themes --
------------
local themes = {
    "SunsetSnow",           -- 1
    "OrangeFractal",        -- 2
    "WarmKanagawa",         -- 3
    "CarpeNoctem",          -- 4
    "CarpeDiem",            -- 5

    "powerarrow",           -- 4
    "powerarrow-blue",      -- 5
    "blackburn",            -- 6
    "Purpel",               -- 8
    "Drakula",              -- 9
    "Aurora",               -- 10
    "multicolor",           -- 11
    "Glass",                -- 12
}

local chosen_theme = themes[4] -- Change the theme by changing the number with the corresponding theme's number

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

----------
-- Tags --
----------
awful.tag(beautiful.tag_names, s, beautiful.tag_layouts)

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ superkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ superkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end)
    --awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    --awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-----------
-- Tasks --
-----------
awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)


-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
-- }}}

-------------------
-- Mouse buttons --
-------------------
root.buttons(my_table.join(
    awful.button({ }, 3, function () beautiful.mymenu:toggle()
    --awful.button({ }, 4, awful.tag.viewnext)
    --awful.button({ }, 5, awful.tag.viewprev)
    end)))

-------------
-- Hotkeys --
-------------
local superkey     = "Mod4"
local altkey       = "Mod1"
local ctrlkey      = "Control"
globalkeys = my_table.join(
------------------
-- Applications -- 
------------------
        --Full screenshot
    awful.key({ }, "Print", function() awful.util.spawn("scrot '%Y-%m-%d_%H:%M:%S_full.png' -e 'mv $f ~/Documents/Skrynšotai'") end,
        {description = "Full screenshot", group = "Applications"}),
    	--Selected screenshot
    awful.key({ superkey, "Shift" }, "s", function() awful.util.spawn("scrot -l style=solid,width=2,color=#00FF00 -s -f '%Y-%m-%d_%H:%M:%S_crop.png' -e 'mv $f ~/Documents/Skrynšotai'") end,
	{description = "Selected screenshot", group = "Applications"}),
        --Bpytop
    awful.key({ superkey }, "Escape", function() awful.util.spawn("alacritty -e bpytop") end,
        {description = "Bpytop", group = "Applications"}),
        --Calculator(F12)
    awful.key({ }, "XF86Calculator", function() awful.util.spawn("galculator") end,
        {description = "Galculator", group = "Applications"}),
    	--Brave
    awful.key({ superkey }, "w", function() awful.util.spawn("brave") end,
        {description = "Brave", group = "Applications"}),
    	--Dmenufm
    awful.key({ superkey }, "e", function() awful.util.spawn("dmenufm") end,
        {description = "Dmenufm", group = "Applications"}),
--    	--albert
--    awful.key({ superkey }, "r", function() awful.util.spawn("albert") end,
--        {description = "Launch albert", group = "Applications"}),
    	--Thunar
    awful.key({ superkey }, "t", function() awful.util.spawn("thunar /home/wolfa/Documents") end,
        {description = "Thunar", group = "Applications"}),
    	--dmenu --'#fea63c'
    awful.key({ superkey }, "y", function() awful.spawn(string.format("dmenu_run -i -nb '#191919' -nf '#a380ff' -sb '#a380ff' -sf '#191919' -fn NotoMonoRegular:bold:pixelsize=14", beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)) end,
	{description = "Dmenu", group = "Applications"}),
        --Hotkey cheatsheet
    awful.key({ superkey }, "p", hotkeys_popup.show_help,
        {description = "Hotkey cheatsheet", group="Applications"}),
	--Variety previous
    awful.key({ altkey }, "[", function () awful.util.spawn("variety --previous") end,
        {description = "Variety PREVIOUS wallpaper", group = "Applications"}),
	--Variety next
    awful.key({ altkey }, "]", function () awful.util.spawn("variety --next") end,
        {description = "Variety NEXT wallpaper", group = "Applications"}),
   	--FreeCAD Failai
    awful.key({ superkey }, "a", function() awful.util.spawn("thunar /home/wolfa/Documents/Viskas/3D_Printeriavimas/Mano_sumodeliuoti/") end,
        {description = "FreeCAD Failai", group = "Applications"}),
    	--FreeCAD
    awful.key({ superkey }, "s", function() awful.util.spawn("freecad") end,
        {description = "FreeCAD", group = "Applications"}),
    	--GIMP
    awful.key({ superkey }, "g", function() awful.util.spawn("gimp") end,
        {description = "GIMP", group = "Applications"}),
        --Terminal
    awful.key({ superkey }, "Return", function () awful.util.spawn("alacritty") end,
        {description = "Terminal", group = "Applications"}),
        --Lock
    awful.key({ superkey }, "z", function () awful.util.spawn("betterlockscreen -l dim -- --time-str=%H:%M") end,
        {description = "Lock", group = "Applications"}),
    	--Logout options
    awful.key({ superkey }, "x", function () awful.util.spawn("archlinux-logout") end,
        {description = "Logout options", group = "Applications"}),
        --Obsidian Lietuviu
    awful.key({ superkey }, "c", function () awful.util.spawn("flatpak run md.obsidian.Obsidian xdg-open 'obsidian://open?vault=9298840e4dfae41e'") end,
        {description = "Obsidian /Lietuviu", group = "Applications"}),
        --Obsidian Asmeninis
    awful.key({ superkey }, "v", function () awful.util.spawn("flatpak run md.obsidian.Obsidian xdg-open 'obsidian://open?vault=b0a00f73f9748721'") end,
        {description = "Obsidian /Asmeninis", group = "Applications"}),

-------------
-- Awesome --
-------------
    	--Reload awesome
    awful.key({ superkey, "Control" }, "r", awesome.restart,
        {description = "Reload awesome", group = "Awesome"}),
        --Quit awesome
    awful.key({ superkey, "Control"}, "x", awesome.quit,
        {description = "Quit awesome", group = "Awesome"}),

----------
-- Tags --
----------
        --Go to last tag
    awful.key({ superkey }, "i", awful.tag.history.restore,
        {description = "Go to last tag", group = "Tags"}),
    --Numbers 1-9 are for tags. Somewhere lower
    	--Previous tag
    awful.key({ superkey }, "Tab",   awful.tag.viewprev,
        {description = "View PREVIOUS", group = "Tags"}),
    	--Next tag
    awful.key({ superkey }, "q",  awful.tag.viewnext,
        {description = "View NEXT", group = "Tags"}),

------------
-- Layout --
------------
        --Client layout manipulation
    awful.key({ superkey, "Shift" }, "h", function() awful.tag.incnmaster( 1, nil, true) end,
        {description = "MORE rows", group = "Layout"}),
    awful.key({ superkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
        {description = "LESS rows", group = "Layout"}),
    awful.key({ superkey, "Shift" }, "j", function() awful.tag.incncol( 1, nil, true) end,
        {description = "MORE columns", group = "Layout"}),
    awful.key({ superkey, "Shift" }, "k", function() awful.tag.incncol(-1, nil, true) end,
        {description = "LESS columns", group = "Layout"}),
	--Selecting layout style
    awful.key({ superkey }, "space", function() awful.layout.inc( 1) end,
        {description = "NEXT layout", group = "Layout"}),
    awful.key({ superkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
        {description = "PREVIOUS layout", group = "Layout"}),

------------------------------------
--ALSA volume control(F1, F2, F3) --
------------------------------------
        --Mute(F1)
    awful.key({ }, "XF86AudioMute", function() os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel)) beautiful.volume.update() end,
        {description = "Volume MUTE", group = "Volume"}),
        --Raise Volume by 5%(F2)
    awful.key({ }, "XF86AudioRaiseVolume", function() os.execute(string.format("amixer -q set %s 5%%+", beautiful.volume.channel)) beautiful.volume.update() end,
	{description = "Volume UP by 5%", group = "Volume"}),
        --Lower Volume by 5%(F3)
    awful.key({ }, "XF86AudioLowerVolume", function() os.execute(string.format("amixer -q set %s 5%%-", beautiful.volume.channel)) beautiful.volume.update() end,
        {description = "Volume DOWN by 5%", group = "Volume"}),
        --Set Volume to 100%
    awful.key({ ctrlkey, "Shift" }, "m", function() os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel)) beautiful.volume.update() end,
        {description = "Volume to 100%", group = "Volume"}),
        --Should be Microphone Mute, but sets the Volume to 50%(F4)
    awful.key({ }, "XF86AudioMicMute", function() os.execute(string.format("amixer -q set %s 50%%", beautiful.volume.channel)) beautiful.volume.update() end,
        {description = "Volume to 50%", group = "Volume"}),
        --Set Volume to 0%
    awful.key({ ctrlkey, "Shift" }, "0", function() os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel)) beautiful.volume.update() end,
        {description = "Volume to 0%", group = "Volume"}),

----------------
-- Brightness --
----------------
    awful.key({ }, "XF86MonBrightnessUp", function() os.execute("brightnessctl -d amdgpu_bl0 s +10%") end,
        {description = "UP by 10%", group = "Brightness"}),
    awful.key({ }, "XF86MonBrightnessDown", function() os.execute("brightnessctl -d amdgpu_bl0 s 10-%") end,
        {description = "DOWN by 10%", group = "Brightness"}),

----------------
-- Media Keys --
----------------
	--Play-Pause
    awful.key({ }, "XF86AudioPlay", function() awful.util.spawn("playerctl play-pause", false) end,
        {description = "Play/Pause", group = "Media"}),
	--Next
    awful.key({ }, "XF86AudioNext", function() awful.util.spawn("playerctl next", false) end,
        {description = "Next", group = "Media"}),
	--Previous
    awful.key({ }, "XF86AudioPrev", function() awful.util.spawn("playerctl previous", false) end,
        {description = "Previous", group = "Media"}),
	--Stop
    awful.key({ }, "XF86AudioStop", function() awful.util.spawn("playerctl stop", false) end,
        {description = "Stop", group = "Media"}),

------------
-- Client --
------------
--        --Next client by index
--    awful.key({ altkey }, "q", function() awful.client.focus.byidx( 1) end,
--        {description = "Focus previous client", group = "Client"}),
--        --Previous client by index
--    awful.key({ altkey }, "Tab", function() awful.client.focus.byidx(-1) end,
--        {description = "Focus next client", group = "Client"}),
        --Swap with next client by index
    awful.key({ "Shift", "Control" }, "j", function() awful.client.swap.byidx( 1) end,
        {description = "Swap with NEXT client by index", group = "Client"}),
        --Swap with previous client by index
    awful.key({ "Shift", "Control" }, "k", function() awful.client.swap.byidx(-1) end,
        {description = "Swap with PREVIOUS client by index", group = "Client"}),
        --Jump to urgent client
    awful.key({ superkey }, "u", awful.client.urgent.jumpto,
        {description = "Jump to urgent client", group = "Client"}),
        --Go to last client
    awful.key({ superkey }, "`",
        function()
            awful.client.focus.history.previous()
            if client.focus then client.focus:raise() end
        end,
        {description = "Go to last client", group = "Client"}),
        --Client focus left
    awful.key({ superkey, "Control" }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "Focus left", group = "Client"}),
        --Client focus down
    awful.key({ superkey, "Control" }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "Focus down", group = "Client"}),
        --Client focus up
    awful.key({ superkey, "Control" }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "Focus up", group = "Client"}),
        --Client focus right
    awful.key({ superkey, "Control" }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "Focus right", group = "Client"}),
        --Master client size adjustment
    awful.key({ altkey, "Shift" }, "l", function() awful.tag.incmwfact( 0.01) end,
        {description = "Master WIDTH factor increase", group = "Client"}),
    awful.key({ altkey, "Shift" }, "h", function() awful.tag.incmwfact(-0.01) end,
        {description = "Master WIDTH factor decrease", group = "Client"}),
    awful.key({ altkey, "Shift" }, "k", function() awful.client.incwfact( 0.05) end,
        {description = "Master HEIGHT factor increase", group = "Client"}),
    awful.key({ altkey, "Shift" }, "j", function() awful.client.incwfact(-0.05) end,
        {description = "Master HEIGHT factor decrease", group = "Client"})
)

clientkeys = my_table.join(
    	--Magnify client
    awful.key({ superkey, "Shift" }, "m", lain.util.magnify_client,
        {description = "Magnify", group = "Client"}),
	--Fullscreen client
    awful.key({ superkey }, "b", function(c) c.fullscreen = not c.fullscreen c:raise() end,
        {description = "Fullscreen", group = "Client"}),
	--Close client
    awful.key({ superkey, "Shift" }, "c", function(c) c:kill() end,
        {description = "Close", group = "Client"}),
	--Toggle floating client
    awful.key({ superkey, "Control" }, "space", awful.client.floating.toggle ,
        {description = "Toggle floating", group = "Client"}),
	--Move to master client
    awful.key({ superkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        {description = "Move to master", group = "Client"}),
	--Minimize client
    awful.key({ superkey }, "n", function(c) c.minimized = true end,
        {description = "Minimize", group = "Client"}),
        --Restore minimized client
    awful.key({ superkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
                if c then
		    client.focus = c
                    c:raise()
		end
	end,
        {description = "Restore minimized", group = "Client"}),
	--Maximixe client
    awful.key({ superkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "Maximize", group = "Client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the hotkey cheatsheet
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "View tag #", group = "Tags"}
        descr_move = {description = "Move focused client to tag #", group = "Client"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ superkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
        descr_view),
        -- Move client to tag.
        awful.key({ superkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                        tag:view_only()
                    end
                end
            end,
        descr_move)
    )
end

--------------------------------------
-- Client manipulation with a mouse --
--------------------------------------
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ superkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ superkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)
-----------
-- Rules --
-----------
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = beautiful.titlebars_enabled } },

    -- Set applications to always map on the tag 1-9 on screen 1.
    -- find class or role via xprop command
    { rule = { class = "Brave-browser" },
      properties = { screen = 1, tag = beautiful.tag_names[2], switchtotag = true } },

    { rule = { class = "FreeCAD" },
      properties = { screen = 1, tag = beautiful.tag_names[6], switchtotag = true } },

    { rule = { class = "Prusa-slicer" },
      properties = { screen = 1, tag = beautiful.tag_names[7], switchtotag = true } },

    { rule = { class = "Gimp" },
      properties = { screen = 1, tag = beautiful.tag_names[8], switchtotag = true } },

    { rule = { class = "Spotify" },
      properties = { screen = 1, tag = beautiful.tag_names[9], switchtotag = true } }},

    { rule = { class = "feh" },
      properties = { maximizeed = true } },
    -- Note that the name property shown in xprop might be set slightly after creation of the client
    -- and the name shown there might not match defined rules here.
    { rule = {
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        },
     }, properties = { floating = true }},

-- Floating clients but centered in screen
    { rule = {
       	class = {
       	  "Polkit-gnome-authentication-agent-1",
          "Arcolinux-calamares-tool.py",
          "Galculator",
	  "Gcolor3",
	},
	name = {
        },
      },
      	properties = { floating = true },
	      	callback = function (c)
    		  awful.placement.centered(c,nil)
       		end }
	
-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
    awful.titlebar(c, {size = beautiful.titlebar_size})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)


-- }}}

-- Autostart applications
awful.spawn.with_shell("~/.config/awesome/autostart.sh")
--awful.spawn.with_shell("picom --config ~/.config/awesome/picom.conf" ) --experimental-backend")
