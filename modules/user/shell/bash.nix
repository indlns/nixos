{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
		};

		initExtra = ''
			if [[ -n "$SSH_CONNECTION" ]]; then
				fastfetch
			fi
		'';
	};
}