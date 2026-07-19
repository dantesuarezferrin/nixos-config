{ pkgs, inputs, ... }:

{
  imports = [
    ./programs
    ./dev
    ./apps
  ];

  home.stateVersion = "24.11";

  xdg.mimeApps.enable = true;
  xdg.configFile."mimeapps.list".force = true;

  nixpkgs.config.allowUnfree = true;
}
