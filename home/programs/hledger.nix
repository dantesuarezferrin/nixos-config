{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hledger
    hledger-ui
    hledger-web
  ];

  home.sessionVariables = {
    LEDGER_FILE = "$HOME/Documents/finanzas/2026.journal";
  };
}
