{ config, pkgs, ... }:

{
# 注意修改这里的用户名与用户目录
	home.username = "sukipai";
	home.homeDirectory = "/home/sukipai";
	programs.home-manager.enable = true;

# 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
# home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

# 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
# home.file.".config/i3/scripts" = {
#   source = ./scripts;
#   recursive = true;   # 递归整个文件夹
#   executable = true;  # 将其中所有文件添加「执行」权限
# };

# 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
# home.file.".xxx".text = ''
#     xxx
# '';

# 通过 home.packages 安装一些常用的软件
# 这些软件将仅在当前用户下可用，不会影响系统级别的配置
	home.packages = with pkgs;[
	];

	programs.zsh = {
		enable = true;
		plugins = [
		{
			name = "zsh-autosuggestions";
			src = pkgs.fetchFromGitHub {
				owner = "zsh-users";
				repo = "zsh-autosuggestions";
				rev = "v0.4.0";
				sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
			};
		}
		];
	};
	home.file.".zshrc".source = ./zshrc;

# git 相关配置
	programs.git = {
		enable = true;
		userName = "songguokunsgg";
		userEmail = "fansong_yan@icloud.com";
	};

# 以下请勿修改
	home.stateVersion = "23.11";
}
