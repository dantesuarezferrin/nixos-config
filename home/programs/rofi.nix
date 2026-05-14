{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg0 = mkLiteral "#282828";
        bg1 = mkLiteral "#3c3836";
        fg0 = mkLiteral "#ebdbb2";
        accent-color = mkLiteral "#cc241d";
        urgent-color = mkLiteral "#fb4934";

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";

        margin = 0;
        padding = 0;
        spacing = 0;
      };

      "window" = {
        background-color = mkLiteral "@bg0";
        border = mkLiteral "2px";
        border-color = mkLiteral "@accent-color";
        border-radius = mkLiteral "6px";
        width = mkLiteral "600px";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
      };

      "inputbar" = {
        font = "JetBrains Mono Nerd Font 12";
        padding = mkLiteral "12px";
        spacing = mkLiteral "12px";
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        text-color = mkLiteral "@accent-color";
      };

      "listview" = {
        columns = 1;
        lines = 8;
        fixed-height = true;
        scrollbar = false;
        spacing = mkLiteral "4px";
        padding = mkLiteral "10px";
      };

      "element" = {
        padding = mkLiteral "8px";
        spacing = mkLiteral "8px";
        border-radius = mkLiteral "4px";
      };

      "element selected" = {
        background-color = mkLiteral "@accent-color";
        text-color = mkLiteral "@bg0";
      };

      "element-icon" = {
        size = mkLiteral "1.5em";
      };
    };
  };
}
