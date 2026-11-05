{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
		pavucontrol
		btop
		fastfetch
		feh
		brightnessctl
		playerctl
		arandr
		dmenu
		antigravity
		xclip
		sesh
		fzf


		nnn
		simplescreenrecorder
  	melonds
		mgba
		qbittorrent
		mplayer
		librecad
		onlyoffice-desktopeditors
		texliveFull
		poppler-utils
		zathura
		xdotool
	
		octaveFull

		inputs.finanzas.packages.${pkgs.system}.default
	];

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
  };

	services.flameshot = {
		enable = true;
		settings = {
			General = {
				savePath = "/home/dante/Pictures/Screenshots/";
    		disabledTrayIcon = true;
				showStartupLaunchMessage = false;
    		saveAsFileExtension = ".png";
    		showDesktopNotification = true;
    		showAbortNotification = false;
    		showHelp = true;
    		showSidePanelButton = true;
			};
		};
	};
}
