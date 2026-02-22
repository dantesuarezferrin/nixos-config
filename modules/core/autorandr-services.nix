{ pkgs, ...}:
{
	systemd.services.autorandr-trigger = {
	  description = "Disparador de autorandr para Dante";
	  serviceConfig = {
	    Type = "oneshot";
	    User = "dante";
	    ExecStart = "${pkgs.autorandr}/bin/autorandr --change --default mobile";
	  };
	  environment = {
	    DISPLAY = ":0";
	    XAUTHORITY = "/run/user/1000/gdm/Xauthority";
	  };
	};
	
	services.udev.extraRules = ''
	  ACTION=="change", SUBSYSTEM=="drm", TAG+="systemd", ENV{SYSTEMD_WANTS}="autorandr-trigger.service"
	'';

	systemd.services.autorandr-resume = {
	  description = "Refrescar monitores al despertar";
	  after = [ "suspend.target" ];
	  wantedBy = [ "suspend.target" ];
	  serviceConfig = {
	    Type = "oneshot";
	    ExecStart = "/run/current-system/sw/bin/sudo -u dante ${pkgs.autorandr}/bin/autorandr --change --default mobile";
	  };
	};
}
