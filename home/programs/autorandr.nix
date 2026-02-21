{ pkgs, ... }:

{
  programs.autorandr = {
    enable = true;
    hooks.postswitch = {
      "restart-i3" = "${pkgs.i3}/bin/i3-msg restart"; 
    };
    
    profiles = {
      "desk" = {
        fingerprint = {
          "HDMI-1" = "*"; 
					"eDP-1" = "*";
        };
        config = {
          "HDMI-1" = {
            enable = true;
            primary = true;
            mode = "1920x1080";
            rate = "144";
          };
          "eDP-1" = { 
            enable = true;
            position = "0x0";
          };
        };
      };
      
      "mobile" = {
        fingerprint = {
					"eDP-1" = "*";
        };
        config = {
          "eDP-1" = {
            enable = true;
            primary = true;
          };
					"HDMI-1" = {
						enable = false;
					};
        };
      };
    };
  };

  services.autorandr.enable = true;
}
