{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        font = wezterm.font("JetBrains Mono"),
        font_size = 13.0,

        color_scheme = "Catppuccin Mocha",

        enable_tab_bar = false,

        default_prog = { "tmux" },
      }
    '';
  };
}

