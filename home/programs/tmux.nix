{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    terminal = "screen-256color";

    clock24 = true;
    mouse = true;

    prefix = "C-Space"; # mucho mejor que C-b

    plugins = with pkgs; [
      tmuxPlugins.resurrect
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];

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

      # Mejorar la copia al portapapeles con xclip
      set -g set-clipboard on
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
      bind-key -T copy-mode y send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
      bind-key -T copy-mode MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
    '';
  };
}

