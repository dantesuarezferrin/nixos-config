{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = "~/.cache/wal/colors-rofi-dark.rasi";
  };
}
