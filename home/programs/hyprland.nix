{
	programs.kitty.enable = true;

	wayland.windowManager.hyprland = {
		enable = true;
		
		settings = {
			"$mod" = "SUPER";
			bind =
			[
				"$mod, W, exec, helium"
				"$mod, Return, exec, kitty"
			];
		};
	};
}
