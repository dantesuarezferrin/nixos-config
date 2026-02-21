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
			corner-radius = 8;
			corner-radius-exclude = [
				"window_type = 'dock'"
				"class_g = 'i3bar'"
			];
			shadow-exclude = [
				"name = 'Notification'"
				"class_g = 'Dmenu'"
			];
			
		};
	};
}
