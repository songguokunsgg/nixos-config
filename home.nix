{ config, pkgs, ... }:

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

{
# 用户名与用户目录
	home = {
		username = "sukipai";
		homeDirectory = "/home/sukipai";
	};
	programs.home-manager.enable = true;

	imports =  [
		./modules/users/sukipai/git/default.nix
	];

# 与 configuration.nix 保持一致
	home.stateVersion = "25.05";
}
