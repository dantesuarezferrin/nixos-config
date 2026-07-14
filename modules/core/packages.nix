{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    texlive.combined.scheme-full # Added for full LaTeX distribution
  ];
}
