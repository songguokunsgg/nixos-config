{ config, lib, pkgs, ... }:

{
	imports =
		[
		./hardware-configuration.nix
		];

# 系统参数设置
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "SUKIPAI"; # Define your hostname.
		networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
		hardware.bluetooth.enable = true;
		hardware.bluetooth.powerOnBoot = true;

	time.timeZone = "Asia/Shanghai";
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.settings.substituters = ["https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"];
	environment.variables.EDITOR = "nvim";
	environment.shells = with pkgs; [ zsh ];

# 声音设置
	sound.enable = true;
	hardware.pulseaudio.enable = false; # false in pipewire
		security.rtkit.enable = true;
		services.pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			jack.enable = true;
		};

# 网络代理设置
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# 输入法设置
	i18n = {
		defaultLocale = "zh_CN.UTF-8";
		supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
	};
	i18n.inputMethod = {
		enabled = "fcitx5";
		fcitx5.addons = with pkgs; [
			fcitx5-mozc
				fcitx5-gtk
				fcitx5-chinese-addons
				fcitx5-configtool
		];
	};


# 图形界面设置
	services.xserver = { 
		enable = true;
		desktopManager.plasma5.enable = true;
		displayManager.sddm.wayland.enable = true;
		displayManager.defaultSession = "plasmawayland";
	};

# 用户设置
	users.users.sukipai= {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
	};

# 软件包设置
	environment.systemPackages = with pkgs; [
		neofetch
			ranger
			zip
			xz
			unzip
			(chromium.override {
			 commandLineArgs = [
			 "--enable-features=UseOzonePlatform"
			 "--ozone-platform=wayland"
			 "--gtk-version=4"
			 ];
			 })
	(vscode.override {
	 commandLineArgs = [
#"--enable-features=UseOzonePlatform"
#"--ozone-platform=wayland"
#"--enable-wayland-ime"
	 ];
	 })
	seafile-client
		obs-studio
		inkscape
		gimp
		julia
		clash-verge
		neovim
		wget
		git
		konsole
		wqy_zenhei
		wqy_microhei
		timeshift
		freerdp
		linux-wifi-hotspot
		blueman
		bluez
		zsh
		];

# 不要修改!!
	system.stateVersion = "23.11";

}

