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
		extraConfig = ''
			set_from_resource $fg i3wm.foreground #ebdbb2
			set_from_resource $bg i3wm.background #282828
			set_from_resource $cursor i3wm.cursorColor #ebdbb2

			# Pywal colors
			include /home/dante/.cache/wal/colors-i3
		'';
		config = {
			modifier = "Mod4";

			#Startup
			startup = [
				{
					command = "wal -R";
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
			colors = {
        #               border  bg      text    indicator childBorder
        focused = {
          border = "$color1"; 
          background = "$color1"; 
          text = "$foreground"; 
          indicator = "$color1"; 
          childBorder = "$color1";
        };
        focusedInactive = {
          border = "$color8"; 
          background = "$color8"; 
          text = "$color15"; 
          indicator = "$color8"; 
          childBorder = "$color8";
        };
        unfocused = {
          border = "$background"; 
          background = "$background"; 
          text = "$color15"; 
          indicator = "$background"; 
          childBorder = "$background";
        };
        urgent = {
          border = "$color9"; 
          background = "$color9"; 
          text = "$foreground"; 
          indicator = "$color9"; 
          childBorder = "$color9";
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
				"${modifier}+d" = "exec --no-startup-id rofi -show drun";

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
						size =  12.0;
					};
					colors = {
						background = "$background";
			      statusline = "$foreground";
			      separator  = "$color8";
			      focusedWorkspace = {
			        border = "$color1";
			        background = "$color1";
			        text = "$foreground";
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
			"ethernet _first_".enable = false;
			"load".enable = false;

			"volume master" = {
				enable = true;
				position = 1;
				settings = {
					format = " %volume";
					format_muted = " ";
					device = "pulse";
				};
			};

			"disk /" = {
				enable = true;
				position = 2;
				settings = { format = "  %avail";};
			};
			"cpu_usage" = {
				enable = true;
				position = 4;
				settings = { format = "  %usage"; };
			};
			"memory" = {
				enable = true;
				position = 3;
				settings = { format = "  %used"; };
			};
			"wireless _first_" = {
				enable = true;
				position = 5;
				settings = {
					format_up = "  %essid";
					format_down = "󰖪  Off";
				};
			};
			"battery all" = {
				enable = true;
				position = 6;
				settings = {
					format = "%status %percentage";
					status_chr = "󱐋";
					status_bat = "";
					status_full ="";
					low_threshold = 20;
					integer_battery_capacity = true;
					last_full_capacity = true;
				};
			};

	    "tztime local" = {
				enable = true;
				position = 7;
				settings = {
					format = " %H:%M %d/%m ";
				};
			};
	  };
	};
}
