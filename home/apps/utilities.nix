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
		gemini-cli
		xclip
		sesh
		fzf
		fd
		zoxide
		nnn
		simplescreenrecorder
		retroarch
  ];
}
