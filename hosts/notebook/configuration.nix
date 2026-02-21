{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
  	../../modules/core/default.nix
		../../modules/desktop/default.nix
	];

  # --- SISTEMA BASE ---
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";

  # --- BOOTLOADER ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- LOCALIZACIÓN Y TIEMPO ---
  time.timeZone = "America/Argentina/Buenos_Aires";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  # --- ENTRADA Y PERIFÉRICOS ---
  services.xserver = {
    enable = true;
    xkb = {
      layout = "latam";
      variant = "";
    };
  };
  console.keyMap = "la-latin1";
  services.printing.enable = true;

  # --- AUDIO (Pipewire) ---
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- RED ---
  networking.networkmanager.enable = true;
  networking.hostName = "notebook";

  # --- USUARIOS ---
  users.users.dante = {
    isNormalUser = true;
    description = "Dante Suarez";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  nix.settings.trusted-users = ["root" "dante"];

  # --- HOME MANAGER ---
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.dante = import ../../home/dante.nix;

	# --- AUTORANDR ---
	systemd.services.autorandr-trigger = {
	  description = "Disparador de autorandr para Dante";
	  serviceConfig = {
	    Type = "oneshot";
	    User = "dante";
			ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
	    ExecStart = "${pkgs.autorandr}/bin/autorandr --change --default mobile";
	  };
	  environment = {
	    DISPLAY = ":0";
	    XAUTHORITY = "/run/user/1000/gdm/Xauthority";
	  };
	};
	
	# La regla de udev se mantiene igual, ya que solo "toca el timbre"
	services.udev.extraRules = ''
	  ACTION=="change", SUBSYSTEM=="drm", TAG+="systemd", ENV{SYSTEMD_WANTS}="autorandr-trigger.service"
	'';

	# -- MONITORES DESPERTAR --
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
