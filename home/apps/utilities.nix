{ pkgs, ... }:
{
  home.packages = with pkgs; [
		pavucontrol
		btop
		fastfetch
		feh
		brightnessctl
		playerctl
		arandr
		dmenu
		pywal
		imagemagick
		gemini-cli
		xclip
		sesh
		fzf
		fd
		zoxide
		nnn
		simplescreenrecorder
  	melonds
		mgba
	];
}
