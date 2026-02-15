{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#notebook";
    };

    initExtra = ''
      eval "$(direnv hook bash)"
    '';
  };
}
