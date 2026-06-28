{ config, pkgs, ... }: 

{
	imports = [
    ../modules/user/platform/linux/default.nix
    ];

	home.shell.enableZshIntegration = true;
	
	home = {
	username = "indlns";
	homeDirectory = "/home/indlns";
	stateVersion = "25.11";
	packages = with pkgs; [
		fastfetch
		htop
		zsh
		nano
		pkgs.nerd-fonts.fira-code
		nerd-fonts.fira-code
		nerd-fonts.droid-sans-mono
		fira-code-symbols
	]; 
	};

	home.sessionVariables = {
		EDITOR = "nano";
		VISUAL = "nano";
	};
}
