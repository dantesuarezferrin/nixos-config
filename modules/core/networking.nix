{
  networking.networkmanager.enable = true;
  networking.hostName = "notebook";
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking.wireless.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = ["enp1s0"];
    allowedUDPPorts = [67 68];
  };
}
