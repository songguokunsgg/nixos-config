{config, pkgs, ...}:

{
	programs.zsh = {
		enable = true;
		shellAliases = {
			ls = "ls -a --color=auto";
			grep = "grep --color=auto";
			cp = "cp -i";
			mv = "mv -i";
			rm = "rm -i";
			update = "sudo nixos-rebuild switch";
			proxy_on = ''
				proxy_statu="on"
				export https_proxy="http://127.0.0.1:7890"
				export http_proxy="http://127.0.0.1:7890"
				export all_proxy="socks5://127.0.0.1:7890"
				echo -e "终端代理已开启。"
				'';
			proxy_off = ''
				unset http_proxy https_proxy all_proxy
				echo -e "终端代理已关闭。"
				proxy_statu="off"
				'';

		};
		oh-my-zsh = {
			enable = true;
			theme = "af-magic";
			plugins = [
				"git"
					"tmux"
					"colorize"
					"cp"
					"vi-mode"
					"last-working-dir"
					"fancy-ctrl-z"
					"sudo"
			];
		};
	};
}
