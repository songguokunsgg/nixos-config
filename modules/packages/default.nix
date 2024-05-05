{config, pkgs, ... }:

{
	imports = [
# 导入字体设置
		./fonts.nix
	];

# 软件包设置
	environment.systemPackages = with pkgs; [

# 系统程序
		hydra-check
			home-manager
			timeshift
			git
			wget
			lua
			virtiofsd

# 终端程序
			fastfetch
			zip
			xz
			unzip
			zsh
			oh-my-zsh
			tmux
			tree

# 编程相关程序, 只适合终端编程
# 由于系统 path 缺失，图形程序并不能找到想要的库，就无法运行
# 图形程序应该使用flake对每个项目单独配置
		python3
		R
		nodejs
		corepack
		texliveFull
		rustup
		jdk
		gcc
		];
}
