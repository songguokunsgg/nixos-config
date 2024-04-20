{config, pkgs, ... }:

{
	imports = [
# 导入字体设置
		./fonts.nix
# 导入 flatpak 包
		./flatpak/default.nix
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
			wl-clipboard
			virtiofsd
			konsole
			freerdp

# 终端程序
			fastfetch
			zip
			xz
			unzip
			zsh
			oh-my-zsh
			tmux
			tree

# electron 程序
			(chromium.override {
			 commandLineArgs = [
			 "--enable-features=UseOzonePlatform"
			 "--ozone-platform=wayland"
			 "--gtk-version=4"
			 ];
			 })
	(qq.override {
	 commandLineArgs = [
	 "--enable-features=UseOzonePlatform"
	 "--ozone-platform=wayland"
	 "--enable-wayland-ime"
	 ];
	 })
	vscode-fhs

# 其他程序
		seafile-client
		obs-studio
		inkscape
		gimp
		clash-verge
		linux-wifi-hotspot
		libreoffice-fresh
		zotero

# 编程相关程序, 只适合终端编程
# 由于系统 path 缺失，图形程序并不能找到想要的库，就无法运行
# 图形程序应该使用flake对每个项目单独配置
		julia
		python3
		R
		nodejs
		corepack
		rstudio
		texliveFull
		rustup
		jdk
		gcc
		];
}
