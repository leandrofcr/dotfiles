local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
    local screen            = wezterm.gui.screens().active
    local ratio             = 0.7
    local width, height     = screen.width * ratio, screen.height * ratio
    local tab, pane, window = wezterm.mux.spawn_window {
      position = {
        x = (screen.width - width) / 2,
        y = (screen.height - height) / 2,
        origin = 'ActiveScreen' }
    }
    -- window:gui_window():maximize()
    window:gui_window():set_inner_size(width, height)
  end)

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations =  "INTEGRATED_BUTTONS|RESIZE",
    enable_scroll_bar = true,
    scrollback_lines = 20000,
    default_cursor_style = "BlinkingBar",
    color_scheme = 'Catppuccin Mocha',
    font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
    font_size = 14,
    macos_window_background_blur = 40,
    -- window_background_opacity = 0.95,
}

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    -- close panel
    {
        key = 'w',
        mods = 'CTRL',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    -- splitting
    {
        mods   = "LEADER",
        key    = "-",
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        mods   = "LEADER",
        key    = "=",
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    -- panel zoom
    {
        mods = 'LEADER',
        key = 'm',
        action = wezterm.action.TogglePaneZoomState
    },
    -- rotate panes
    {
        mods = "LEADER",
        key = "Space",
        action = wezterm.action.RotatePanes "Clockwise"
    },
    -- show the pane selection mode, but have it swap the active and selected panes
    {
        mods = 'LEADER',
        key = '0',
        action = wezterm.action.PaneSelect {
            mode = 'SwapWithActive',
        },
    } }

return config
