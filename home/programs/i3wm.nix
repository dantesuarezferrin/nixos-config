{ pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		i3status
		i3lock
	];


	xresources.properties = {
		"Xcursor.theme" = "Bibata-Modern-Amber";
		"Xcursor.size" = 18;
	};

	xsession.windowManager.i3 = {
		enable = true;
		config = {
			modifier = "Mod4";

			#Startup
			startup = [

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
				# Basicos
				"${modifier}+w" = "exec helium";
				"${modifier}+Return" = "exec wezterm";
				"${modifier}+q" = "kill";
				"${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run -fn 'JetBrains Mono Nerd Font-10' -nb '#282828' -nf '#ebdbb2' -sb '#cc241d' -sf '#ebdbb2'";

				# Movimiento
				"${modifier}+h" = "focus left";
				"${modifier}+j" = "focus down";
				"${modifier}+k" = "focus up";
				"${modifier}+l" = "focus right";

				# Volumen
				"XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
				"XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
				"XF86AudioMute"        = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
				# Brillo
				"XF86MonBrightnessUp"   = "exec --no-startup-id brightnessctl set +10%";
				"XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 10%-";

				# Media Control (Spotify, Navegador)
				"XF86AudioPlay" = "exec --no-startup-id playerctl play-pause";
				"XF86AudioNext" = "exec --no-startup-id playerctl next";
				"XF86AudioPrev" = "exec --no-startup-id playerctl previous";
			};

			bars = [
				{
					position = "top";
					statusCommand = "${pkgs.i3status}/bin/i3status";
					fonts = {
						names = [ "JetBrains Mono Nerd Font"];
						size = 10.0;
					};
					colors = {
						background = "#282828"; # Gruvbox Dark
			      statusline = "#ebdbb2";
			      separator  = "#665c54";
			      focusedWorkspace = {
			        border = "#cc241d";
			        background = "#cc241d";
			        text = "#ebdbb2";
						};
					};
				}
			];

    workspaceOutputAssign = [
      { workspace = "1"; output = [ "HDMI-1" "eDP-1" ]; }
    ];
		};
	};

	programs.i3status = {
	  enable = true;
	  
	  general = {
	    colors = true;
	    interval = 5;
	    color_good      = "#b8bb26"; # Verde
	    color_degraded  = "#fabd2f"; # Amarillo
	    color_bad       = "#fb4934"; # Rojo vibrante
	  };
	
	  modules = {
	    "ipv6".enable = false;
	    "wireless _first_".enable = true;
	    "ethernet _first_".enable = true;
	    "battery all".enable = true;
	    "disk /".enable = true;
	    "load".enable = true;
	    "memory".enable = true;
	    "tztime local".enable = true;
	  };
	};
}
