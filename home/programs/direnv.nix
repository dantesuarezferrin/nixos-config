{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  home.sessionVariables = {
    DIRENV_LOG_FORMAT = "";
  };
  config = {
    bash = {
      source = ''
        source ${pkgs.devenv}/share/devenv/direnvrc
      '';
    };
  };
}
