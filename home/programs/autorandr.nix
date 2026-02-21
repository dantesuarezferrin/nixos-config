{ pkgs, ... }:

{
  programs.autorandr = {
    enable = true;
    
    hooks.postswitch = {
      "restart-i3" = "${pkgs.i3}/bin/i3-msg restart";
    };
    
  };

  services.autorandr.enable = true;
}
