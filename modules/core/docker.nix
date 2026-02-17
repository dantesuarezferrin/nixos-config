{ config, pkgs, ...}:
{
	virtualisation.docker = {
		enable = true;
		enableOnBoot = true;
		rootless = {
			enable = true;
			setSocketVariable = true;
		};
	};

	users.users.dante.extraGroups = ["docker"];
}
