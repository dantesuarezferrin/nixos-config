{ pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		i3status
		dmenu
		i3lock
		arandr
		feh
	];


	xsession.windowManager.i3 = {
		enable = true;
		config = {
			modifier = "Mod4";

			#Startup
			startup = [
			
				{
				#Display
				command = "xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144.00";
				always = true;
				notification = false;
				};

				{
				#Wallpaper
				command = "feh --bg-fill '/home/dante/Pictures/redflow.jpg'";
				always = true;
				notification = false;
				}
			];

			# Windows 
			window = {
				titlebar = false;
				border = 1;
			};

			floating = {
				titlebar = false;
				border = 1;
			};
			
			# Colors
			colors = let 
        bg      = "#282828";
        red     = "#cc241d";  
        gray    = "#928374";
        text    = "#ebdbb2";
        inactive = "#3c3836";
      in {
        #               border  bg      text    indicator childBorder
        focused = {
          border = red; 
          background = red; 
          text = text; 
          indicator = red; 
          childBorder = red;
        };
        focusedInactive = {
          border = inactive; 
          background = inactive; 
          text = gray; 
          indicator = inactive; 
          childBorder = inactive;
        };
        unfocused = {
          border = bg; 
          background = bg; 
          text = gray; 
          indicator = bg; 
          childBorder = bg;
        };
        urgent = {
          border = "#fb4934"; 
          background = "#fb4934"; 
          text = text; 
          indicator = "#fb4934"; 
          childBorder = "#fb4934";
        };
      };

			#Keybindings
			keybindings = let
				modifier = "Mod4";
			in lib.mkOptionDefault {
				"${modifier}+w" = "exec helium";
				"${modifier}+Return" = "exec wezterm";
				"${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
				"${modifier}+q" = "kill";

				"${modifier}+h" = "focus left";
				"${modifier}+j" = "focus down";
				"${modifier}+k" = "focus up";
				"${modifier}+l" = "focus right";
			};

			bars = [
				{
					position = "top";
					statusCommand = "${pkgs.i3status}/bin/i3status";
				}
			];
		};
	};
}
