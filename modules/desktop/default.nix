{config, pkgs, ... }:

{
# 输入法设置
	i18n = {
		defaultLocale = "zh_CN.UTF-8";
		supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
		inputMethod = {
			enabled = "fcitx5";
			fcitx5.addons = with pkgs; [
				fcitx5-mozc
					fcitx5-gtk
					fcitx5-chinese-addons
					fcitx5-configtool
			];
		};
	};

# 图形界面设置
	services = {
		xserver.enable = true;
		desktopManager.plasma6.enable = true;
		displayManager.sddm = {
			wayland.enable = true;
			theme.enable = true;
		};
	};


# 图形应用程序设置
	imports = [
		./flatpak/default.nix
	];

	environment = {
# electron 应用启用 wayland
		sessionVariables.NIXOS_OZONE_WL = "1";

		systemPackages = with pkgs; [
# electron 程序
			(qq.override {
			 commandLineArgs = [
			 "--enable-wayland-ime"
			 ];
			 })
		(vscode.override {
		 commandLineArgs = [
		 "--enable-wayland-ime"
		 ];
		 })
# KDE 程序
		kdePackages.konsole
			kdePackages.kcalc
# 其他程序
			firefox
			freerdp3
			obs-studio
			wl-clipboard
			seafile-client
			inkscape
			gimp
			clash-verge
			linux-wifi-hotspot
			libreoffice-fresh
			zotero
			rstudio
			];
	};
}
