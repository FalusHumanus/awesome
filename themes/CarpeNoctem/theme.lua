------------------------------------------
-- CarpeNoctem theme for the awesome wm --
-- configured by @FalusHumanus          --
------------------------------------------
local beautiful = require("beautiful")
local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local freedesktop = require("freedesktop")
local naughty = require("naughty")
local menubar = require("menubar")
local brightness = require("brightness")
brightness_ctrl = brightness({
       --backend = "brightnessctl",
       --step = 255,
       timeout = 0.01,
       --levels = {1, 25, 50, 75, 100},
       })
local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.config_dir                                = os.getenv("HOME") .. "/.config/awesome/themes/CarpeNoctem"
theme.wallpaper                                 = theme.config_dir .. "/WhiteOrangeBlueWaterWaveSunset.png"
theme.font                                      = "Arimo Bold 11"
-----------------------------
-- Colors same as terminal --
theme.black                                     = "#000000"
theme.gray                                      = "#000000"
theme.gray2                                     = "#000000"
theme.white                                     = "#ffffff"
theme.red                                       = "#ff0000"
theme.red2                                      = "#550000"
theme.yellow                                    = "#000000"
theme.yellow2                                   = "#000000"
theme.green                                     = "#00ff00"
theme.green2                                    = "#005500"
theme.cyan                                      = "#000000"
theme.cyan2                                     = "#000000"
theme.blue                                      = "#0000ff"
theme.blue2                                     = "#000055"
theme.magenta                                   = "#000000"
theme.magenta2                                  = "#000000"
-----------------------------
theme.bg_flag                                   = "#333333"
theme.accent_color                              = "#ffffff"
--Background color--
theme.bg_normal                                 = "#333333"
theme.bg_transparent                            = "#00000000"
theme.bg_focus                                  = theme.bg_normal
theme.bg_urgent                                 = "#ff000077"
theme.bg_minimize                               = theme.bg_normal
--Text color--
theme.fg_normal                                 = "#999999"
theme.fg_focus                                  = theme.accent_color
theme.fg_urgent                                 = theme.fg_normal
theme.fg_minimize                               = "#777777"
--Taglist(Main bar) color--
theme.taglist_bg_focus                          = theme.bg_normal
theme.taglist_bg_urgent                         = theme.bg_normal
theme.taglist_bg_occupied                       = theme.bg_normal
theme.taglist_bg_empty                          = theme.bg_normal
theme.taglist_bg_volatile                       = "#0000ff" --theme.bg_normal
theme.taglist_fg_focus                          = theme.fg_focus
theme.taglist_fg_urgent                         = theme.fg_urgent
theme.taglist_fg_occupied                       = theme.accent_color
theme.taglist_fg_empty                          = theme.fg_normal
theme.taglist_fg_volatile                       = "#00ff00" --theme.accent_color
theme.wibar_bg                                  = "#00000000"
theme.wibar_fg                                  = "#000000ff"
--Tasklist color--
theme.tasklist_bg_normal                        = theme.bg_transparent
theme.tasklist_bg_focus                         = theme.accent_color
theme.tasklist_bg_urgent                        = theme.bg_urgent
theme.tasklist_fg_normal                        = theme.fg_normal
theme.tasklist_fg_focus                         = theme.fg_normal
theme.tasklist_fg_urgent                        = theme.fg_urgent
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
--Titlebar color--
theme.titlebars_enabled                         = false
theme.titlebar_alignment                        = "center"
theme.titlebar_bg_normal                        = "#cccccc"
theme.titlebar_bg_focus                         = theme.accent_color
theme.titlebar_fg_normal                        = theme.fg_normal
theme.titlebar_fg_focus                         = theme.fg_normal
theme.titlebar_size                             = dpi(21)
--Tooltip color--
theme.tooltip_font                              = theme.font
--theme.tooltip_opacity                           = 1
theme.tooltip_fg_color                          = theme.accent_color
theme.tooltip_bg_color                          = theme.bg_normal
--Dmenu color--
--theme.dmenu_font                                = theme.font
--theme.dmenu_bg_color                            = theme.bg_normal
--theme.dmenu_fg_color                            = theme.accent_color
--Hotkey cheatsheet--
theme.hotkeys_font                              = theme.font
theme.hotkeys_description_font                  = theme.hotkeys_font
theme.hotkeys_bg                                = theme.bg_normal
theme.hotkeys_fg                                = theme.fg_normal
theme.hotkeys_border_width                      = dpi(0)
theme.hotkeys_border_color                      = theme.bg_normal
--theme.hotkeys_shape                             = rounded_bar(cr, 70, 70)
theme.hotkeys_opacity                           = 1
theme.hotkeys_modifiers_fg                      = theme.fg_normal
theme.hotkeys_label_bg                          = theme.bg_normal
theme.hotkeys_label_fg                          = theme.fg_normal
theme.hotkeys_group_margin                      = dpi(3)
--Client border--
theme.useless_gap                               = dpi(5)
theme.border_width                              = dpi(2)
theme.border_normal                             = theme.bg_normal
theme.border_focus                              = theme.accent_color
theme.border_marked                             = "#00ff00"
--Menu--
theme.menu_bg_normal                            = theme.bg_normal
theme.menu_bg_focus                             = theme.accent_color
theme.menu_fg_normal                            = theme.fg_normal
theme.menu_fg_focus                             = theme.fg_normal
theme.menu_border_color                         = theme.accent_color
theme.menu_border_width                         = dpi(0)
theme.menu_height                               = dpi(25)
theme.menu_width                                = dpi(260)
theme.menu_submenu_icon                         = theme.config_dir .. "/icons/submenu.png"
--Notifications--
theme.notification_font                         = theme.font
theme.notification_bg                           = theme.bg_normal
theme.notification_fg                           = theme.fg_normal
naughty.config.defaults['border_width']         = theme.border_width
theme.notification_border_color                 = theme.accent_color
--theme.notification_shape                        = square
theme.notification_opacity                      = 1
naughty.config.defaults['margin']               = dpi(5)
theme.notification_width                        = nil
theme.notification_heigth                       = nil
theme.notification_max_width                    = 500
theme.notification_max_heigth                   = 200
theme.notification_icon_size                    = 100
naughty.config['padding']                       = dpi(5)
naughty.config['spacing']                       = dpi(5)
naughty.config.defaults['position']             = "top_right"
naughty.config.defaults['timeout']              = 5
--Widget Icons and Text Colors--
--Textclock--
theme.widget_clock                              = theme.config_dir .. "/icons/clock.png"
theme.widget_clock_text                         = theme.fg_normal
theme.widget_date_text                          = theme.fg_normal
--Calendar--
theme.widget_cal_fg_color                       = theme.fg_normal
theme.widget_cal_bg_color                       = theme.bg_normal
--fs--
theme.widget_fs                                 = theme.config_dir .. "/icons/fs.png"
--Brightness--
theme.widget_brightness                         = theme.config_dir .. "/icons/sun.png"
theme.widget_brightness_text                    = theme.fg_normal
--CPU--
theme.widget_cpu                                = theme.config_dir .. "/icons/cpu.png"
theme.widget_cpu_text                           = theme.fg_normal
--Coretemp--
theme.widget_temp                               = theme.config_dir .. "/icons/temp.png"
theme.widget_temp_text                          = theme.fg_normal
--Battery--
theme.widget_battery                            = theme.config_dir .. "/icons/batt.png"
theme.widget_battery_text                       = theme.fg_normal
theme.widget_battery_UNplugged                  = theme.config_dir .. "/icons/battred.png"
theme.widget_battery_UNplugged_text             = theme.fg_normal
theme.widget_battery_pluggedIN                  = theme.config_dir .. "/icons/battgreenac.png"
theme.widget_battery_pluggedIN_text             = theme.fg_normal
--ALSA volume--
theme.widget_volume                             = theme.config_dir .. "/icons/spkr.png"
theme.widget_volume_text                        = theme.fg_normal
--Network--
theme.widget_netdown                            = theme.config_dir .. "/icons/net_down.png"
theme.widget_netdown_text                       = theme.fg_normal
theme.widget_netup                              = theme.config_dir .. "/icons/net_up2.png"
theme.widget_netup_text                         = theme.fg_normal
--Memory (RAM)--
theme.widget_ram                                = theme.config_dir .. "/icons/mem.png"
theme.widget_ram_text                           = theme.fg_normal
--MDP--
theme.widget_music                              = theme.config_dir .. "/icons/note.png"
theme.widget_music_on                           = theme.config_dir .. "/icons/note.png"
theme.widget_music_pause                        = theme.config_dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.config_dir .. "/icons/stop.png"
theme.widget_music_text                         = theme.fg_normal
--Other--
theme.widget_power                              = theme.config_dir .. "/icons/shutdownW.png"
theme.widget_lightning                          = theme.config_dir .. "/icons/lightningW.png"
theme.widget_uptime                             = theme.config_dir .. "/icons/ac.png"
theme.widget_weather                            = theme.config_dir .. "/icons/dish.png"
theme.widget_mail                               = theme.config_dir .. "/icons/mail.png"
--Layout Widget Icons--
theme.layout_tile                               = theme.config_dir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.config_dir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.config_dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.config_dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.config_dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.config_dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.config_dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.config_dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.config_dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.config_dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.config_dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.config_dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.config_dir .. "/icons/floating.png"
theme.layout_centerwork                         = theme.config_dir .. "/icons/centerwork.png"
theme.layout_centerworkh                        = theme.config_dir .. "/icons/centerworkh.png"
--Titlebar Icons--
theme.titlebar_close_button_normal              = theme.config_dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.config_dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.config_dir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.config_dir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.config_dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.config_dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.config_dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.config_dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.config_dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.config_dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.config_dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.config_dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.config_dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.config_dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.config_dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.config_dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.config_dir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.config_dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.config_dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.config_dir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local textclock = wibox.widget {
    {
        {
           font = theme.font,
           widget = awful.widget.textclock(markup(theme.widget_date_text, "%b %d %H:%M")),
        },
	top = 5,
	right = 4,
	bottom = 5,
	left = 6,
        widget = wibox.container.margin,
    },
    bg = theme.bg_flag,
    shape = function(cr, width, height, tl, tr, br, bl, rad)
        gears.shape.partially_rounded_rect(cr, width, height, true, false, false, true, 13)
    end,
    widget = wibox.container.background,
}

-- Calendar
--[[theme.cal = lain.widget.cal({
    attach_to = { textclock },
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

local brightness = wibox.widget{
    {
	    {	
    id = "text_role",
    widget = brightness_ctrl.widget,
    },
    top = 5,
    right = 3,
    bottom = 5,
    left = 6,
    widget = wibox.container.margin,
    },
    bg = theme.bg_flag,
    fg = theme.fg_normal,
    shape = function(cr, width, height, tl, tr, br, bl, rad)
        gears.shape.partially_rounded_rect(cr, width, height, false, false, false, true, 13)
    end,
    shape_clip = true,
    widget = wibox.container.background
}

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
local bat = wibox.widget {
    {
    lain.widget.bat({
        settings = function()
            local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "% " or bat_now.perc
            widget:set_markup(markup.fontfg(theme.font, theme.widget_battery_text, perc))
            if bat_now.ac_status == 1 then
            		baticon:set_image(theme.widget_battery_pluggedIN)
            		widget:set_markup(markup.fontfg(theme.font, theme.widget_battery_pluggedIN_text, perc))
                --perc = perc .. " "
            elseif bat_now.ac_status == 0 then
            		baticon:set_image(theme.widget_battery_UNplugged)
            		widget:set_markup(markup.fontfg(theme.font, theme.widget_battery_UNplugged_text, perc))
                --perc = perc .. " "
            end
        end}),
    top = 5,
    right = 3,
    bottom = 5,
    left = 6,
    widget = wibox.container.margin,
    },
    bg = theme.bg_flag,
    fg = theme.fg_normal,
    shape = function(cr, width, height, tl, tr, br, bl, rad)
        gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, 13)
    end,
    shape_clip = true,
    widget = wibox.container.background
}


-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_volume)
local volume = wibox.widget{
    {
        lain.widget.alsa({
            settings = function()
                if volume_now.status == "off" then
                    volume_now.level = volume_now.level .. "M"
                end
                widget:set_markup(markup.fontfg(theme.font, theme.widget_volume_text, volume_now.level .. "%"))
            end}),
        top = 5,
        right = 3,
        bottom = 5,
        left = 6,
        widget = wibox.container.margin,
    },
    bg = theme.bg_flag,
    fg = theme.fg_normal,
    shape = function(cr, width, height, tl, tr, br, bl, rad)
        gears.shape.partially_rounded_rect(cr, width, height, false, false, false, true, 13)
    end,
    shape_clip = true,
    widget = wibox.container.background
}

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
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "arandr", "arandr" },
}

awful.util.mymainmenu = freedesktop.menu.build({
    before = {
        { "My Awesome Menu", myawesomemenu },
        -- other triads can be put here
    },
    after = {
        { "Terminal", "alacritty" },
        { "Log out", function() awesome.quit() end },
        { "Sleep", "systemctl suspend" },
        { "Restart", "systemctl reboot" },
        { "Shutdown", "systemctl poweroff" },
        -- other triads can be put here
   }
})

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
    local taglist = wibox.widget {
        {
            awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons),
            margins = 8,
            widget = wibox.container.margin,
        },
        bg = theme.taglist_bg_empty,
        shape = function(cr, width, height, tl, tr, br, bl, rad)
            gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 13)
        end,
        widget = wibox.container.background,
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons,
        layout = {
            spacing = 1,
            layout  = wibox.layout.fixed.horizontal,
        },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
        widget_template = {
            {
                {
                    {
                        { 
                            {
                                id = 'text_role',
                                widget = wibox.widget.textbox,
                            },
                            layout = wibox.layout.fixed.horizontal,
                        },
                        left = 5,
                        right = 5,
                        widget = wibox.container.margin
	            },
	            id = 'background_role',
	            widget = wibox.container.background,
	        },
	        direction = "north",
	        widget = wibox.container.rotate,
            },
            layout = wibox.layout.align.horizontal,
        },
    }
    --[[ Create a tasklist widget
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
            layout  = wibox.layout.fixed.vertical
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
                        forced_width  = 20,
			forced_height = 350,
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.vertical,
                },
                left  = 2,
                right = 2,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
    }]]

    -- Create the wibox
    s.mywibox = awful.wibar({position = "top", screen = s, height = dpi(30)})
    -- Add widgets to the left wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            taglist,
            s.mylayoutbox,
        },
        -- Middle widget
	s.mytasklist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
	    s.mytaglist,
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
            volicon,
            volume,
            baticon,
            bat,
            sunicon,
	    brigthness,
            textclock,
        },
    }
end

--awful.spawn.with_shell("picom --config ~/.config/awesome/themes/CarpeNoctem/picom.conf")

return theme
