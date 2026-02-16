{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.colors = {
        foreground    = "#ebdbb2",
        background    = "#282828",
        cursor_bg     = "#ebdbb2",
        cursor_fg     = "#282828",
        selection_bg  = "#ebdbb2",
        selection_fg  = "#282828",
        scrollbar_thumb = "#3c3836",
        split         = "#3c3836",
        ansi = {
          "#282828", "#cc241d", "#98971a", "#d79921", 
          "#458588", "#b16286", "#689d6a", "#a89984"
        },
        brights = {
          "#928374", "#fb4934", "#b8bb26", "#fabd2f", 
          "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"
        },
      }

      config.font = wezterm.font("JetBrains Mono Nerd Font")
      config.font_size = 11.5
      config.window_background_opacity = 0.90
      config.window_padding = {
        left = 12, right = 12, top = 12, bottom = 12,
      }
      config.hide_tab_bar_if_only_one_tab = true

      return config
    '';
  };
}
