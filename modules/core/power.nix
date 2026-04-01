{ config, pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;

  # Performance & Gaming
  programs.gamemode.enable = true;
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesPkgs = [ pkgs.ananicy-rules-cachyos ];
  };

  # Memory optimization
  zramSwap.enable = true;

  # Thermal & Power Management
  services.thermald.enable = true;
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  # Disable TLP and Power Profiles Daemon to avoid conflicts with auto-cpufreq
  services.power-profiles-daemon.enable = false;
  services.tlp.enable = false;

  powerManagement.powertop.enable = true;
}
