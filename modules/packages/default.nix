{config, pkgs, ... }:

{
# 导入 flatpak 包
	imports = [
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
			neofetch
			ranger
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
	qq
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
# 字体
		wqy_zenhei
		wqy_microhei

# 编程相关程序, 只适合终端编程
# 由于系统 path 缺失，图形程序并不能找到想要的库，就无法运行
		julia
		conda
		R
		nodejs_21
		corepack_21
		rstudio
		texliveFull
		rustup
		gcc
		];
}
