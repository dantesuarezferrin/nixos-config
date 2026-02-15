{ config, pkgs, ... }:

{
  services.power-profiles-daemon.enable = false;
  hardware.cpu.intel.updateMicrocode = true;

  services.thermald.enable = true;

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

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

      PCIE_ASPM_ON_BAT = "powersave";
      USB_AUTOSUSPEND = 1;
    };
  };

  powerManagement.powertop.enable = true;
}
