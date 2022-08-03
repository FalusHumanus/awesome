--[[

     OrangeFractal based on Multicolor Awesome WM theme 2.0
					 github.com/lcpz

--]]


local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/Aurora"
--theme.wallpaper                                 = theme.confdir .. "/OrangeFractal.png"
--theme.wallpaper                                 = "/usr/share/backgrounds/arcolinux/arco-wallpaper.jpg"
theme.font                                      = "Noto Sans Regular 11"
theme.taglist_font                              = "Noto Sans Regular 11"
--theme.menu_bg_normal                            = "#000000"
--theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#000000"
theme.bg_focus                                  = "#000000"
theme.bg_urgent                                 = "#ff0000"
theme.bg_minimize				= "#000000"
theme.fg_normal                                 = "#bbbbbb"
theme.fg_focus                                  = "#a277ff"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#555555"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#000000"
theme.border_focus                              = "#a277ff"
theme.border_marked                             = "#91231c"
theme.menu_border_width                         = 0
theme.menu_height                               = dpi(25)
theme.menu_width                                = dpi(260)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#bbbbbb"
theme.menu_fg_focus                             = "#a277ff"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.hotkeys_modifiers_fg			= "#555555"
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/batt.png"
theme.widget_battred                            = theme.confdir .. "/icons/battred.png"
theme.widget_battac                             = theme.confdir .. "/icons/battac.png"
theme.widget_battgreenac                        = theme.confdir .. "/icons/battgreenac.png"
theme.widget_brightsun                          = theme.confdir .. "/icons/sun.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
theme.widget_music                              = theme.confdir .. "/icons/note.png"
theme.widget_music_on                           = theme.confdir .. "/icons/note.png"
theme.widget_music_pause                        = theme.confdir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.confdir .. "/icons/stop.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0
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
theme.layout_centerwork				= theme.confdir .. "/icons/centerwork.png"
theme.layout_centerworkh			= theme.confdir .. "/icons/centerworkh.png"
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
local mytextclock = wibox.widget.textclock(markup("#61ffca", "%b %d ") .. markup("#ff005a", "%H:%M "))
mytextclock.font = theme.font

-- Calendar
--[[theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Noto Sans Mono Medium 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
]]--})

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 2803138, -- placeholder (Belgium)
    notification_preset = { font = "Noto Sans Mono Medium 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
    end
})

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

-- Mail IMAP check
--[[ commented because it needs to be set before use
local mailicon = wibox.widget.imagebox()
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            mailicon:set_image(theme.widget_mail)
            widget:set_markup(markup.fontfg(theme.font, "#cccccc", mailcount .. " "))
        else
            widget:set_text("")
            --mailicon:set_image() -- not working in 4.0
            mailicon._private.image = nil
            mailicon:emit_signal("widget::redraw_needed")
            mailicon:emit_signal("widget::layout_changed")
        end
    end
})
--]]

local sunicon = wibox.widget.imagebox(theme.widget_brightsun)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffff00", cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#00dada", coretemp_now .. "°C "))
    end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_batt)
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "% " or bat_now.perc
        widget:set_markup(markup.fontfg(theme.font, "#dddddd", perc .. " "))
        
        if bat_now.ac_status == 1 then
			baticon:set_image(theme.widget_battgreenac)
			widget:set_markup(markup.fontfg(theme.font, "#20ff20", perc .. " "))
            --perc = perc .. " "
        elseif bat_now.ac_status == 0 then
			baticon:set_image(theme.widget_battred)
			widget:set_markup(markup.fontfg(theme.font, "#ff4040", perc .. " "))
            --perc = perc .. " "
        end

    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end

        widget:set_markup(markup.fontfg(theme.font, "#445bfc", volume_now.level .. "% "))
    end
})

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end

        widget:set_markup(markup.fontfg(theme.font, "#ff00f1", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#78d600", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ff49bc", mem_now.used .. "M "))
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
            widget:set_markup(markup.font(theme.font, markup("#FFFFFF", artist) .. " " .. title))
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font(theme.font, " mpd paused "))
            mpdicon:set_image(theme.widget_music_pause)
        else
            widget:set_text("")
            mpdicon:set_image(theme.widget_music)
        end
    end
})

-- Each screen has its own tag table.
--local names = { "MainTile", "Main", "Internet", "Modeling", "Printing", "Coding", "7", "8", "Games" }
--local l = awful.layout.suit  -- Just to save some typing: use an alias.
--local lainl = lain.layout
--local layouts = { l.tile, l.floating, lainl.centerwork, l.max, l.max, l.tile, l.max, l.floating, l.max }
--awful.tag(awful.util.tagnames, s, layouts)

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
                     color         = '#000000',
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
            --mailicon,
            --mail.widget,
            --mpdicon,
            --theme.mpd.widget,
            --weathericon,
            --theme.weather.widget,
            --mykeyboardlayout,
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            cpuicon,
            cpu.widget,
            tempicon,
            temp.widget,
            memicon,
            memory.widget,
            volicon,
            theme.volume.widget,
            baticon,
            bat.widget,
            sunicon,
            brightness_ctrl.widget,
            --clockicon,
            mytextclock,
            --wibox.widget.systray(),
            --s.mylayoutbox,
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
