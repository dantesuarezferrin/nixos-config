{ config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      push.autoSetupRemote = true;
      core.editor = "nvim";
      user = {
          name = "Dante Suarez";
          email = "dante.suarezferrin1@gmail.com";
        };
    };
    
  };
  programs.delta.enable = true;
}
