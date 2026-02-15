{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    terminal = "screen-256color";

    clock24 = true;
    mouse = true;

    prefix = "C-Space"; # mucho mejor que C-b

    extraConfig = ''
      set -g history-limit 100000
      set -g base-index 1
      setw -g pane-base-index 1

      set-option -g renumber-windows on

      # split más cómodo
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # reload rápido
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"
    '';
  };
}

