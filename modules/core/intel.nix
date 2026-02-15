{ pkgs, ... }:

{
  # Activar soporte de hardware para gráficos (reemplaza al viejo hardware.opengl)
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # Driver moderno para i5-8265U (Gen 8+)
      intel-vaapi-driver # Driver tradicional (fallback)
      libvdpau-va-gl     # Soporte para VDPAU vía VA-API
    ];
  };

  # Opcional: Para que las aplicaciones de 32 bits (como Steam o Wine) 
  # también tengan aceleración.
  hardware.graphics.enable32Bit = true;

  # Variables de entorno para forzar el uso de los drivers de Intel
  environment.sessionVariables = { 
    LIBVA_DRIVER_NAME = "iHD"; 
  };

  # Herramientas para monitorear el consumo de la GPU
  environment.systemPackages = with pkgs; [
    intel-gpu-tools # Incluye 'intel_gpu_top'
    libva-utils     # Incluye 'vainfo'
  ];
}
