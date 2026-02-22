{ pkgs, ... }:
{
  home.packages = with pkgs; [
		btop
		fastfetch
		feh
		brightnessctl
		playerctl
		arandr
		dmenu
		gemini-cli
		xclip
  ];
}
