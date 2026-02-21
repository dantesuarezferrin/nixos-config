{pkgs, ...}:
{
	services.picom = {
		enable = true;

		backend = "glx";
		vSync = true;

		shadow = true;
		shadowOpacity = 0.75;

		opacityRules = [
			"100:class_g = 'wezterm'"
		];
		
		settings = {
			shadow-exclude = [
				"name = 'Notification'"
				"class_g = 'Dmenu'"
				"class_g = 'i3bar'"
				"window_type = 'dock'"
			];
			
		};
	};
}
