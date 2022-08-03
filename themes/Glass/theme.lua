--[[

       Glass by wolfa

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local freedesktop = require("freedesktop")
local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


main_accent_color = "#ff0055"

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/Glass"
theme.wallpaper                                 = theme.confdir .. "/BlueRedBlurry.jpg"
theme.font                                      = "Arimo Bold 11"
theme.taglist_font                              = theme.font
			--Wibox Background--
theme.bg_normal                                 = "#00000000" --Background
theme.bg_focus                                  = "#00000000" --Focus Client/Tag
theme.bg_urgent                                 = "#ff0000aa" --Urgent Client/Tag
theme.bg_minimize                               = "#000000aa" --Minimized Client
			--Wibox Text--
theme.fg_normal                                 = "#bbbbbb" --Normal
theme.fg_focus                                  = main_accent_color --Focus Client/Tag
theme.fg_urgent                                 = "#af1d18" --Urgent Client/Tag
theme.fg_minimize                               = "#555555" --Minimized Client
			--Client Border--
theme.border_width                              = dpi(2)
theme.corner_rounding                           = 0
theme.border_normal                             = "#000000" --nonFocus
theme.border_focus                              = main_accent_color --Focus
theme.border_marked                             = "#91231c" --Marked
theme.useless_gap                               = 0
			--Menu--
theme.menu_border_width                         = 0
theme.menu_height                               = dpi(25)
theme.menu_width                                = dpi(260)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#000000" --Text Normal
theme.menu_fg_focus                             = "#000000" --Text Focus
theme.menu_bg_normal                            = "#bbbbbb55" --Background Normal
theme.menu_bg_focus                             = main_accent_color --Background Focus
			--Hotkey Cheatsheet--
theme.hotkeys_modifiers_fg                      = "#bbbbbb" --Text Modkeys
theme.hotkeys_fg                                = "#ffffff" --Text Description
theme.hotkeys_bg                                = "#000000aa" --Background
			--Widget Icons ant Text Colors--
-- Textclock
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_clock_text                         = theme.fg_normal --Clock Text
theme.widget_date_text                          = theme.fg_normal --Date Text
-- Calendar
theme.widget_cal_fg_color                       = theme.fg_normal --
theme.widget_cal_bg_color                       = theme.bg_normal
-- fs
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
-- Brightness
theme.widget_brightness                         = theme.confdir .. "/icons/sun.png"
theme.widget_brightness_text                    = theme.fg_normal
-- CPU
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_cpu_text                           = theme.fg_normal
-- Coretemp
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_temp_text                          = theme.fg_normal
-- Battery
theme.widget_battery                            = theme.confdir .. "/icons/batt.png"
theme.widget_battery_text                       = theme.fg_normal
theme.widget_battery_UNplugged                  = theme.confdir .. "/icons/battred.png"
theme.widget_battery_UNplugged_text             = theme.fg_normal
theme.widget_battery_pluggedIN                  = theme.confdir .. "/icons/battgreenac.png"
theme.widget_battery_pluggedIN_text             = theme.fg_normal
-- ALSA volume
theme.widget_volume                             = theme.confdir .. "/icons/spkr.png"
theme.widget_volume_text                        = theme.fg_normal
-- Network
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netdown_text                       = theme.fg_normal
theme.widget_netup                              = theme.confdir .. "/icons/net_up2.png"
theme.widget_netup_text                         = theme.fg_normal
-- Memory (RAM)
theme.widget_ram                                = theme.confdir .. "/icons/mem.png"
theme.widget_ram_text                           = theme.fg_normal
-- MDP
theme.widget_music                              = theme.confdir .. "/icons/note.png"
theme.widget_music_on                           = theme.confdir .. "/icons/note.png"
theme.widget_music_pause                        = theme.confdir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.confdir .. "/icons/stop.png"
theme.widget_music_text                         = theme.fg_normal
-- Other
theme.widget_power                              = theme.confdir .. "/icons/shutdownW.png"
theme.widget_lightning                          = theme.confdir .. "/icons/lightningW.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
			--Tag Open Clients Indicator--
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
			--Tasklist--
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
			--Layout Widget Icons--
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.layout_centerwork                         = theme.confdir .. "/icons/centerwork.png"
theme.layout_centerworkh                        = theme.confdir .. "/icons/centerworkh.png"
			--Titlebar Icons--
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup(theme.widget_date_text, "%b %d ") .. markup(theme.widget_clock_text, "%H:%M "))
mytextclock.font = theme.font
-- Calendar
--[[theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = theme.font
        fg   = theme.widget_cal_fg_color,
        bg   = theme.widget_cal_bg_color
	}
]]--})

-- / fs
--[[ commented because it needs Gio/Glib >= 2.54
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
    notification_preset = { font = "Noto Sans Mono Medium 10", fg = theme.fg_normal },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, "#80d9d8", string.format("%.1f", fs_now["/"].used) .. "% "))
    end
})
--]]

-- Brightness Sun
local sunicon = wibox.widget.imagebox(theme.widget_brightness)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.widget_cpu_text, cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.widget_temp_text, coretemp_now .. "°C "))
    end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "% " or bat_now.perc
        widget:set_markup(markup.fontfg(theme.font, theme.widget_battery_text, perc .. " "))
        if bat_now.ac_status == 1 then
			baticon:set_image(theme.widget_battery_pluggedIN)
			widget:set_markup(markup.fontfg(theme.font, theme.widget_battery_pluggedIN_text, perc .. " "))
            --perc = perc .. " "
        elseif bat_now.ac_status == 0 then
			baticon:set_image(theme.widget_battery_UNplugged)
			widget:set_markup(markup.fontfg(theme.font, theme.widget_battery_UNplugged_text, perc .. " "))
            --perc = perc .. " "
        end
    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_volume)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end
        widget:set_markup(markup.fontfg(theme.font, theme.widget_volume_text, volume_now.level .. "% "))
    end
})

-- Network
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.widget_netup_text, net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, theme.widget_netdown_text, net_now.received .. " "))
    end
})

-- Memory (RAM)
local memicon = wibox.widget.imagebox(theme.widget_ram)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.widget_ram_text, mem_now.used .. "M "))
    end
})

-- MPD
local musicplr = "urxvt -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 1, function ()
        awful.spawn.with_shell("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        awful.spawn.with_shell("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ modkey }, 3, function () awful.spawn.with_shell("pkill ncmpcpp") end),
    awful.button({ }, 3, function ()
        awful.spawn.with_shell("mpc stop")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
            widget:set_markup(markup.font(theme.font, markup(theme.widget_music_text, artist) .. " " .. title))
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font(theme.font, " mpd paused "))
            mpdicon:set_image(theme.widget_music_pause)
        else
            widget:set_text("")
            mpdicon:set_image(theme.widget_music)
        end
    end
})

--- Menus
awful.util.applicationmenu = freedesktop.menu.build({ })
appmenu = awful.widget.launcher({ image = theme.widget_lightning, menu = awful.util.applicationmenu })

awful.util.shutdownmenu = awful.menu({
	{ "Hotkeys", function() return false, hotkeys_popup.show_help end },
	{ "Lock", "betterlockscreen -l dim -- --time-str=%H:%M" },
	{ "Sleep", "systemctl suspend" },
	{ "Restart", "systemctl reboot" },
	{ "Shutdown", "systemctl poweroff" },
	{ "Log out", function() awesome.quit() end },
})
systemmenu = awful.widget.launcher({ image = theme.widget_power, menu = awful.util.shutdownmenu })

-- Tag Names and Layouts
--theme.tag_names = { "mono¹", "duo²", "tri³", "tetra⁴", "penta⁵", "hexa⁶", "hepta⁷", "octo⁸", "ennea⁹", }
--theme.tag_names = { "ένας(énas)¹", "δύο(dýo)²", "τρία(tría)³", "τέσσερα(téssera)⁴", "πέντε(pénte)⁵", "έξι(éxi)⁶", "επτά(eptá)⁷", "οκτώ(októ)⁸", "εννέα(ennéa)⁹" }
--theme.tag_names = { "", "", "", "", "", "", "", "", "", }
--Use this : https://fontawesome.com/cheatsheet
--theme.tag_names = { "", "", "", "", "" }
--theme.tag_names = { "1T", "2T", "3T", "4F", "5F", "6F", "7M", "8M", "9M" }
--theme.tag_names = { "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹" }
--theme.tag_names = { "Main¹", "MainTile²", "Internet³", "Modeling⁴", "Printing⁵", "Coding⁶", "7⁷", "8⁸", "Games⁹" }
--theme.tag_names = { "One¹", "Two²", "Three³", "Four⁴", "Five⁵", "Six⁶", "Seven⁷", "Eight⁸", "Nine⁹" }
theme.tag_names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
local l = awful.layout.suit -- just an alias
local lainl = lain.layout -- just an alias
theme.tag_layouts = { l.tile, l.tile, l.tile, l.tile, l.tile, l.max, l.max, l.max, l.max }

function theme.at_screen_connect(s)
    -- Quake application
   -- s.quake = lain.util.quake({ app = awful.util.terminal })
   s.quake = lain.util.quake({ app = "urxvt", height = 0.50, argname = "--name %s" })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
--    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons) 
    s.mytasklist = awful.widget.tasklist {
         screen   = s,
         filter   = awful.widget.tasklist.filter.currenttags,
         buttons  = awful.util.tasklist_buttons,
         layout   = {
             spacing_widget = {
                 {
                     forced_width  = 5,
                     forced_height = 20,
                     thickness     = 1,
                     color         = theme.bg_normal,
                     widget        = wibox.widget.separator
                 },
                 valign = 'center',
                 halign = 'center',
                 widget = wibox.container.place,
             },
             spacing = 1,
             layout  = wibox.layout.fixed.horizontal
         },
         -- Notice that there is *NO* `wibox.wibox` prefix, it is a template,
         -- not a widget instance.
         widget_template = {
             {
                 {
                     {
                         {
                             id     = 'icon_role',
                             widget = wibox.widget.imagebox,
                         },
                         margins = 2,
                         widget  = wibox.container.margin,
                     },
                     {
			 forced_width  = 150,
			 forced_height = 20,
                         id     = 'text_role',
                         widget = wibox.widget.textbox,
                     },
                     layout = wibox.layout.fixed.horizontal,
                 },
                 left  = 2,
                 right = 2,
                 widget = wibox.container.margin
             },
             id     = 'background_role',
             widget = wibox.container.background,
         },
     }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
	    appmenu, 
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            s.mytaglist,
            --s.mypromptbox,
            s.mytasklist,
        },
        -- Middle widget
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mpdicon,
            --theme.mpd.widget,
            --mykeyboardlayout,
            --netdownicon,
            --netdowninfo,
            --netupicon,
            --netupinfo.widget,
            --cpuicon,
            --cpu.widget,
            --tempicon,
            --temp.widget,
            --memicon,
            --memory.widget,
            --volicon,
            --theme.volume.widget,
            baticon,
            bat.widget,
            sunicon,
            brightness_ctrl.widget,
            --clockicon,
            mytextclock,
            --wibox.widget.systray(),
            --s.mylayoutbox,
	    systemmenu,
        },
    }
end
    -- Create the bottom wibox
    --s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the bottom wibox
--    s.mybottomwibox:setup {
--        layout = wibox.layout.align.horizontal,
--        { -- Left widgets
--            layout = wibox.layout.fixed.horizontal,
--        },
--        s.mytasklist, -- Middle widget
--        { -- Right widgets
--            layout = wibox.layout.fixed.horizontal,
--            s.mylayoutbox,
--        },
--    }
--end

return theme
