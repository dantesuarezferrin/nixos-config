{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
  ];

  programs.thunderbird = {
    enable = true;
    profiles = {
      "dante" = {
        isDefault = true;
      };
    };
  };
}
