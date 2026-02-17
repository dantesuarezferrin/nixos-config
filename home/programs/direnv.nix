{ pkgs, ... }:

{
  home.packages = [ pkgs.devenv ];

	programs.bash.sessionVariables = {
		DIRENV_LOG_FORMAT = "";
	};
	
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    
    stdlib = ''
      use_devenv() {
        watch_file devenv.nix
        watch_file devenv.yaml
        watch_file devenv.local.nix
        
        eval "$(devenv print-dev-env --quiet)"
      }
    '';
  };
}
