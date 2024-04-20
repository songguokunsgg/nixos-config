{config, pkgs, ...}:

{
	programs.zsh = {
		enable = true;
# initExtra 会覆盖掉之前定义的配置，建议直接写在zshrc里面
		initExtra = ''
			source /etc/nixos/modules/users/sukipai/zsh/p10k.zsh
			source /etc/nixos/modules/users/sukipai/zsh/zshrc
			'';
		zplug = {
			enable = true;
			plugins = [
			{
				name = "zsh-users/zsh-autosuggestions";
			}	
			{
				name = "zsh-users/zsh-syntax-highlighting";
			}	
			{
				name = "zsh-users/zsh-completions";
			}
			{
				name = "romkatv/powerlevel10k";
				tags = [ as:theme depth:1 ];
			}
			];
		};
	};
}
