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

  # --- USUARIOS ---
  users.users.dante = {
    isNormalUser = true;
    description = "Dante Suarez";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" ];
  };
  nix.settings.trusted-users = ["root" "dante"];

	# --- MAQUINA VIRTUAL ---
	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;

  # --- HOME MANAGER ---

  home-manager.users.dante = {
		imports = [
			../../home/dante.nix 
		];
	};

	# --- Nix-Ld ---
	programs.nix-ld.enable = true;
}
