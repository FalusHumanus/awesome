--[[

     Purpel based on Multicolor Awesome WM theme 2.0
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
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/Purpel"
theme.font                                      = "Noto Sans Regular 11"
theme.taglist_font                              = theme.font
			--Wibox Background--
theme.bg_normal                                 = "#000000" --Background
theme.bg_focus                                  = "#000000" --Focus Client/Tag
theme.bg_urgent                                 = "#ff0000" --Urgent Client/Tag
theme.bg_minimize                               = "#000000" --Minimized Client
			--Wibox Text--
theme.fg_normal                                 = "#bbbbbb" --Normal
theme.fg_focus                                  = "#a380ff" --Focus Client/Tag
theme.fg_urgent                                 = "#af1d18" --Urgent Client/Tag
theme.fg_minimize                               = "#555555" --Minimized Client
			--Client border--
theme.border_width                              = dpi(2)
theme.border_normal                             = "#000000" --nonFocus
theme.border_focus                              = "#a380ff" --Focus
theme.border_marked                             = "#91231c" --Marked
theme.useless_gap                               = 0
			--Menu--
theme.menu_border_width                         = 0
theme.menu_height                               = dpi(25)
theme.menu_width                                = dpi(260)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#bbbbbb" --Text Normal
theme.menu_fg_focus                             = "#ff8c00" --Text Focus
theme.menu_bg_normal                            = "#050505dd" --Background Normal
theme.menu_bg_focus                             = "#050505dd" --Background Focus
			--Hotkey Cheatsheet--
theme.hotkeys_modifiers_fg                      = "#00ee00" --Text Modkeys
theme.hotkeys_fg                                = "#0000ff" --Text Description
theme.hotkeys_bg                                = "#000000" --Background
			--Widget Icons--
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up2.png"
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
theme.layout_centerwork				= theme.confdir .. "/icons/centerwork.png"
theme.layout_centerworkh			= theme.confdir .. "/icons/centerworkh.png"
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
local mytextclock = wibox.widget.textclock(markup("#597ccf", "%b %d ") .. markup("#de5e1e", "%H:%M "))
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

local sunicon = wibox.widget.imagebox(theme.widget_brightsun)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
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
        widget:set_markup(markup.fontfg(theme.font, "#7493d2", volume_now.level .. "% "))
    end
})

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#b946df", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
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
