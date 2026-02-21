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
			shadow-exclude = [
				"name = 'Notification'"
				"class_g = 'Dmenu'"
			];
		};
	};
}
