{ pkgs, ... }:

let
  set-theme = pkgs.writeShellScriptBin "set-theme" ''
    if [ -z "$1" ]; then
      echo "Uso: set-theme /ruta/a/la/imagen.jpg"
      exit 1
    fi

    IMAGE_PATH=$(realpath "$1")

    # Generar colores con pywal
    ${pkgs.pywal}/bin/wal -i "$IMAGE_PATH"

    # Establecer fondo de pantalla
    ${pkgs.feh}/bin/feh --bg-fill "$IMAGE_PATH"

    # Recargar i3 para aplicar colores (si es necesario)
    ${pkgs.i3}/bin/i3-msg reload
  '';
in
{
  home.packages = [ set-theme ];
}
