{ pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		i3status
		dmenu
		i3clock
	];


	xsession.windowManager.i3 = {
		enable = true;
		config = {
			modifier = "Mod4";
			terminal = "wezterm";

			keybindings = let
				modifier = "Mod4";
			in lib.mkOptionDefault {
				"${modifier}+Return" = "exec wezterm";
				"${modifier}+Space" = "exec exec ${pkgs.dmenu}/bin/dmenu_run";
				"${modifier}+q" = "kill";
				"${modifier}+w" = "exec helium";

				"${modifier}+h" = "focus left";
				"${modifier}+j" = "focus down";
				"${modifier}+k" = "focus up";
				"${modifier}+l" = "focus right";
			};

			bars = [
				{
					position = "top";
					satusCommand = "${pkgs.i3status}/bin/i3status";
				}
			];
		};
	};
};
