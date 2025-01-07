{config, pkgs, ... }:

{
# boot 设置
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

# 网络设置
	networking = {
		hostName = "nixos";
		networkmanager.enable = true;
	};

# 硬件设置
	hardware = {
		bluetooth = {
			enable = false;
			powerOnBoot = false;
		};
		graphics = {
			enable = true;
			extraPackages = with pkgs; [
				mesa.drivers
			];
		};
	};

	nix  = {
# 实验性功能启用
		settings = {
			experimental-features = [ "nix-command" "flakes" ];
		};
# 自动垃圾回收
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};
	};
	nixpkgs.config.allowUnfree = true;
	programs = {
		zsh.enable = true;
		dconf.enable = true;
	};

# podman 和 KVM 设置
	virtualisation  =  { 
		podman = {
			enable = true;
			dockerCompat = true;
		};
	};
	
# time and fonts setting
	time.timeZone = "Asia/Shanghai";
	i18n.defaultLocale = "zh_CN.UTF-8";

	fonts = {
		packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-cjk-serif
			source-code-pro
			hack-font
			jetbrains-mono
			wqy_microhei
			wqy_zenhei
		];
	};

# 系统自动更新
	system.autoUpgrade.enable = true;
}