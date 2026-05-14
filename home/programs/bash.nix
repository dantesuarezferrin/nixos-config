{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    
		sessionVariables = {
			DIRENV_LOG_FORMAT = "";
		};

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#notebook";
      config = "cd ~/nixos-config && nvim";
			theme = "set-theme";
    };

    initExtra = ''
      eval "$(direnv hook bash)"
      update-git() {
      if [ -z "$1" ]; then
        echo "Error: Debes proporcionar una descripción para el commit."
        return 1
      fi
      git add .
      git commit -m "$1"
      git push origin main
      }
    '';
  };
}
