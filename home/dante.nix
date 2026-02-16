{ pkgs, inputs, ... }:

{
  imports = [
    ./programs
    ./dev
    ./apps
  ];

  home.stateVersion = "24.11";
}
