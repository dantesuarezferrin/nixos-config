{ pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		i3status
		dmenu
		i3lock
	];


	xsession.windowManager.i3 = {
		enable = true;
		config = {
			modifier = "Mod4";

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
