{ pkgs, ... }:
{
  home.packages = with pkgs; [

    # nix tooling
    nil
    nixfmt

    # formatters (opcionales globales)
    stylua
    shfmt

    # terminal power tools
    lazygit
    tree
    unzip
    jq

    # búsqueda
    ripgrep
    fd
  ];
}

