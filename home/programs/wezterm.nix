{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''

      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      -- Leer colores de pywal
      local function scheme_for_appearance(appearance)
        local wal_colors_file = wezterm.home_dir .. "/.cache/wal/colors.json"
        local f = io.open(wal_colors_file, "r")
        if f ~= nil then
          local content = f:read("*all")
          f:close()
          local wal_colors = wezterm.json_decode(content)
          return {
            foreground = wal_colors.special.foreground,
            background = wal_colors.special.background,
            cursor_bg = wal_colors.special.cursor,
            cursor_fg = wal_colors.special.background,
            selection_bg = wal_colors.special.foreground,
            selection_fg = wal_colors.special.background,
            ansi = {
              wal_colors.colors.color0, wal_colors.colors.color1, wal_colors.colors.color2, wal_colors.colors.color3,
              wal_colors.colors.color4, wal_colors.colors.color5, wal_colors.colors.color6, wal_colors.colors.color7,
            },
            brights = {
              wal_colors.colors.color8, wal_colors.colors.color9, wal_colors.colors.color10, wal_colors.colors.color11,
              wal_colors.colors.color12, wal_colors.colors.color13, wal_colors.colors.color14, wal_colors.colors.color15,
            },
          }
        else
          -- Fallback a Gruvbox si no hay colores de wal
          return {
            foreground = "#ebdbb2", background = "#282828",
            cursor_bg = "#ebdbb2", cursor_fg = "#282828",
            selection_bg = "#ebdbb2", selection_fg = "#282828",
            ansi = { "#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984" },
            brights = { "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },
          }
        end
      end

      config.colors = scheme_for_appearance(wezterm.gui.get_appearance())

      config.font = wezterm.font("JetBrains Mono Nerd Font")
      config.font_size = 11.5
      config.window_background_opacity = 0.90
      config.window_padding = {
        left = 12, right = 12, top = 12, bottom = 12,
      }
      config.hide_tab_bar_if_only_one_tab = true

      config.keys = {
        {
          key = 'c',
          mods = 'CTRL|SHIFT',
          action = wezterm.action.CopyTo 'Clipboard',
        },
        {
          key = 'v',
          mods = 'CTRL|SHIFT',
          action = wezterm.action.PasteFrom 'Clipboard',
        },
      }

      return config
    '';
  };
}
