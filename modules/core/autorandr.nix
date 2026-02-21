{ ... }:

{
  programs.autorandr = {
    enable = true;
    hooks.postswitch = {
      "restart-i3" = "i3-msg restart"; 
    };
    
    profiles = {
      "desk" = {
        fingerprint = {
          "HDMI-1" = "*"; 
        };
        config = {
          "HDMI-1" = {
            enable = true;
            primary = true;
            mode = "1920x1080";
            rate = "144.00";
          };
          "eDP-1" = { 
            enable = true;
            position = "0x0";
          };
        };
      };
      
      "mobile" = {
        fingerprint = {
          "HDMI-1" = null;
        };
        config = {
          "eDP-1" = {
            enable = true;
            primary = true;
          };
        };
      };
    };
  };

  services.autorandr.enable = true;
}
