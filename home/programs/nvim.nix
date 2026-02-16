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
    keymaps = [
      { mode = "n"; key = "<leader>ff"; action = ":Telescope find_files<CR>"; options.desc = "Buscar archivos"; }
      { mode = "n"; key = "<leader>fg"; action = ":Telescope live_grep<CR>"; options.desc = "Buscar texto (grep)"; }
      { mode = "n"; key = "<leader>fb"; action = ":Telescope buffers<CR>"; options.desc = "Ver buffers abiertos"; }
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }
    ];

    opts = {
      number = true; # Números de línea
      relativenumber = true; # Números relativos
      shiftwidth = 2; # Identación
      smartindent = true;
      termguicolors = true;
    };

    # Plugins esenciales
    plugins = {
      lualine.enable = true; # Barra de estado
      telescope.enable = true; # Buscador de archivos
      treesitter.enable = true; # Resaltado de sintaxis
      web-devicons.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true; # Python
          ts_ls.enable = true; # TypeScript/React
          nixd.enable = true; # Nix
          html.enable = true;
          cssls.enable = true;
        };
      };
    };
  };
}
