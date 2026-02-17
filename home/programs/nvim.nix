{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # --- ESTÉTICA Y TEMA ---
    colorschemes.gruvbox.enable = true;

    # --- OPCIONES GLOBALES ---
    globals.mapleader = " ";

    opts = {
      number = true;         # Números de línea
      relativenumber = true; # Números relativos
      shiftwidth = 2;        # Tamaño de indentación
      tabstop = 2;           # Tamaño del tabulador
      smartindent = true;    # Indentación inteligente
      termguicolors = true;  # Colores reales en la terminal
      cursorline = true;     # Resaltar la línea actual
    };

    # --- ATAJOS DE TECLADO GENERALES ---
    keymaps = [
      # Buscador (Telescope)
      { mode = "n"; key = "<leader>ff"; action = ":Telescope find_files<CR>"; options.desc = "Buscar archivos"; }
      { mode = "n"; key = "<leader>fg"; action = ":Telescope live_grep<CR>"; options.desc = "Buscar texto (grep)"; }
      { mode = "n"; key = "<leader>fb"; action = ":Telescope buffers<CR>"; options.desc = "Ver buffers abiertos"; }
      
      # Navegación entre ventanas
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }

			# Navegacion entre buffers
			{ mode = "n"; key = "<S-h>"; action = "<cmd>BufferLineCyclePrev<cr>"; options.desc = "Buffer anterior"; }
 			{ mode = "n"; key = "<S-l>"; action = "<cmd>BufferLineCycleNext<cr>"; options.desc = "Buffer siguiente"; }
			{ mode = "n"; key = "<leader>bd"; action = "<cmd>bdelete<cr>"; options.desc = "Cerrar buffer"; }
    ];

    # --- PLUGINS ---
    plugins = {
      # Interfaz y Visual
      lualine.enable = true;
      web-devicons.enable = true;
      indent-blankline.enable = true;
      bufferline.enable = true;
      telescope.enable = true;
      treesitter.enable = true;

      # DASHBOARD
      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              ""
              "      ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗      "
              "      ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║      "
              "      ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║      "
              "      ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║      "
              "      ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║      "
              "      ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝      "
              ""
              "             [ Dante's Development OS ]                 "
              ""
            ];
            center = [
              { action = "Telescope find_files"; desc = " Buscar archivos"; icon = " "; key = "f"; }
              { action = "Telescope oldfiles";   desc = " Archivos recientes"; icon = " "; key = "r"; }
              { action = "ene | startinsert";    desc = " Nuevo archivo"; icon = " "; key = "n"; }
              { action = "qa";                   desc = " Salir"; icon = " "; key = "q"; }
            ];
          };
        };
      };

      # AUTOCOMPLETADO (CMP)
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      # LENGUAJES (LSP) - Integración corregida
      lsp = {
        enable = true;
        keymaps.lspBuf = {
          "gd" = "definition";       # Ir a definición
          "gD" = "declaration";      # Ir a declaración
          "gi" = "implementation";   # Ir a implementación
          "gt" = "type_definition";  # Definición de tipo
          "K"  = "hover";            # Ver documentación (flotante)
          "<leader>rn" = "rename";   # Renombrar variable en todo el proyecto
          "<leader>ca" = "code_action"; # Sugerencias de arreglo
        };
        
        servers = {
          pyright.enable = true; # Python
          ts_ls.enable = true;   # React
          nixd.enable = true;    # NixOS
          html.enable = true;
          cssls.enable = true;
        };
      };
    };
  };
}
