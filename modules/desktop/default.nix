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
		xserver = { 
			enable = true;
			desktopManager = { 
				plasma5.enable = true;
			};
		};
		displayManager = {
			sddm.wayland.enable = true;
			defaultSession = "plasmawayland";
		};
	};
}
