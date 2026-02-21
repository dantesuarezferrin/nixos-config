{ pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.bibata-cursors
	];

	environment.variables = {
		XCURSOR_THEME = "Bibata-Modern-Amber";
		XCURSOR_SIZE = "18";
	};

	services.xserver.displayManager.sessionCommands = "${pkgs.xsetroot}/bin/xsetroot -cursor_name left_ptf";

	programs.dconf.enable = true;
}
