{ pkgs, ... }:

{
  home.packages = [ pkgs.devenv ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.file.".direnvrc".text = ''
    source ${pkgs.devenv}/share/devenv/direnvrc
  '';
}
