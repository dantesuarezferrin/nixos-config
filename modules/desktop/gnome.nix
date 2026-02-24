{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.desktopManager.gnome.enable = true;
}
