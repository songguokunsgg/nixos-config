{config, pkgs, ... }:

{
# 系统参数设置
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};
	networking = {
		hostName = "SUKIPAI";
		networkmanager.enable = true;
	};
	hardware = {
		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
		opengl.enable = true;
	};
	nix  = {
		settings = {
			experimental-features = [ "nix-command" "flakes" ];
# substituters = ["https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"];
		};
# 自动垃圾回收
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};
	};
	nixpkgs.config.allowUnfree = true;
	services.flatpak.enable = true;
	programs = {
		zsh.enable = true;
		dconf.enable = true;
		virt-manager.enable = true;
	};
	time.timeZone = "Asia/Shanghai";

# docker 和 KVM 设置
	virtualisation  =  { 
		docker = {
			enable = true;
			storageDriver = "btrfs";
		};
		libvirtd.enable = true;
# waydroid.enable = true;
	};

# 声音设置
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

# 系统自动更新
	system.autoUpgrade.enable = true;
}
