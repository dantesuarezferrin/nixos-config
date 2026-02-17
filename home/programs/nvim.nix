{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;

    # --- OPCIONES GLOBALES ---
    globals.mapleader = " ";

    opts = {
      number = true;         
      relativenumber = true; 
      shiftwidth = 2;        
      tabstop = 2;           
      smartindent = true;    
      termguicolors = true;  
      cursorline = true;     
    };

    # --- KeyBinds ---
    keymaps = [
      # Telescope
      { mode = "n"; key = "<leader>ff"; action = ":Telescope find_files<CR>"; options.desc = "Buscar archivos"; }
      { mode = "n"; key = "<leader>fg"; action = ":Telescope live_grep<CR>"; options.desc = "Buscar texto (grep)"; }
      { mode = "n"; key = "<leader>fb"; action = ":Telescope buffers<CR>"; options.desc = "Ver buffers abiertos"; }
      
      # Navegación de ventanas 
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }

      # Navegación de Buffers 
      { mode = "n"; key = "<S-h>"; action = "<cmd>BufferLineCyclePrev<cr>"; options.desc = "Archivo anterior"; }
      { mode = "n"; key = "<S-l>"; action = "<cmd>BufferLineCycleNext<cr>"; options.desc = "Archivo siguiente"; }
    ];

    # --- PLUGINS ---
    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;
      indent-blankline.enable = true;
      bufferline.enable = true;
      telescope.enable = true;
      treesitter.enable = true;

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
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
        };
      };

      # LSP
      lsp = {
        enable = true;
        keymaps.lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gi" = "implementation";
          "K"  = "hover";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
        };
        servers = {
          pyright.enable = true;
          ts_ls.enable = true;
          nixd.enable = true;
        };
      };
    };
  };
}
