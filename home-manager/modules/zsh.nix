{ pkgs, ... }:
{
    #programs.zsh.loginShell = true; 
    programs.zsh = {
    enable = true;                      # включаем Zsh
    enableCompletion = true;            # автодополнение команд
    autosuggestion.enable = true;       # ghost suggestions из истории
    syntaxHighlighting.enable = true;    # подсветка синтаксиса
    oh-my-zsh.enable = true;
    oh-my-zsh.plugins = [ "git" "sudo" "extract" ]; # встроенные плагины Oh My Zsh

    plugins = [
    {
    name = "powerlevel10k";
    src = pkgs.zsh-powerlevel10k;
    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    ];

    initContent = ''
    # Загружаем тему
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

    # Загружаем конфиг p10k
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

	if [[ -n "$SSH_CONNECTION" ]]; then
		fastfetch
	fi
	'';
    };
}