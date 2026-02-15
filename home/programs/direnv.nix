{ pkgs, ... }:

{
  home.packages = [ pkgs.devenv ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    
    stdlib = ''
      use_devenv() {
        watch_file devenv.nix
        watch_file devenv.yaml
        watch_file devenv.local.nix
        
        eval "$(devenv shell --print-bash-setup)"
      }
    '';
  };
}
