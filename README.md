# ❄️ Dante's NixOS Configuration

Mi configuración personal de NixOS, diseñada para ser **modular**, **reproducible** y **eficiente**. Basada en Flakes y Home Manager.

## 💻 Hardware: Notebook i5-8265U
Este setup está optimizado para una notebook con procesador **Intel Whiskey Lake**:
- **CPU:** Intel i5-8265U
- **GPU:** Intel UHD 620 (Aceleración de hardware activa via VA-API)
- **RAM:** 16GB
- **Almacenamiento:** 480GB SSD (con Trim activo)

## 🚀 Características principales
- **Modularidad:** Separación estricta entre Hardware, Sistema y Usuario.
- **Eficiencia Energética:** Configuración de `TLP` y `auto-cpufreq` para maximizar la batería.
- **Entorno de Escritorio:** GNOME (producción) y Hyprland (experimental).
- **Editor:** Neovim (LazyVim) encapsulado con todas sus dependencias de C/Lua.

## 📂 Estructura
- `hosts/`: Configuraciones específicas por máquina.
- `modules/`: Lógica del sistema (Red, Audio, Energía, etc.).
- `home/`: Configuración de aplicaciones y entorno de usuario via Home Manager.

## 🛠️ Instalación
```bash
sudo nixos-rebuild switch --flake .#notebook
