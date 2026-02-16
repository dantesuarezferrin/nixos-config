{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;

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

    keymaps = [
      { mode = "n"; key = "<leader>ff"; action = ":Telescope find_files<CR>"; options.desc = "Buscar archivos"; }
      { mode = "n"; key = "<leader>fg"; action = ":Telescope live_grep<CR>"; options.desc = "Buscar texto (grep)"; }
      { mode = "n"; key = "<leader>fb"; action = ":Telescope buffers<CR>"; options.desc = "Ver buffers abiertos"; }
      
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }
      
      { mode = "n"; key = "<leader>w"; action = ":w<CR>"; options.desc = "Guardar"; }
      { mode = "n"; key = "<leader>q"; action = ":q<CR>"; options.desc = "Salir"; }
    ];

    plugins = {
      # Interfaz y Visual
      lualine.enable = true;
      web-devicons.enable = true;
      indent-blankline.enable = true;
      bufferline.enable = true;
      
      # Funcionalidad
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

      # LENGUAJES (LSP)
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true; # Python
          ts_ls.enable = true;   # TypeScript/React
          nixd.enable = true;    # Nix
          html.enable = true;
          cssls.enable = true;
        };
      };
    };
  };
}
