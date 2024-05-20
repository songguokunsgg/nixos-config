{config, pkgs, ... }:

{
# 服务项设置
	imports = [
# 内网穿透服务
		./auto-launch/SakuraFrp/default.nix
	];

# boot 设置
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
		};
		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = false;
		};
	};
# 网络设置
	networking = {
		hostName = "SUKIPAI";
		networkmanager.enable = true;
	};

# 硬件设置
	hardware = {
		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
		opengl = {
			enable = true;
			driSupport = true;
			driSupport32Bit = true;
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
	services.flatpak.enable = true;
	programs = {
		zsh.enable = true;
		dconf.enable = true;
		virt-manager.enable = true;
	};
	time.timeZone = "Asia/Shanghai";

# podman 和 KVM 设置
	virtualisation  =  { 
		libvirtd.enable = true;
		podman = {
			enable = true;
			dockerCompat = true;
#defaultNetwork.settings.dns_enabled = true;
		};
	};
		  # Cockpit
  services.cockpit = {
	enable = true;
	port = 9090;
	settings = {
	  WebService = {
		AllowUnencrypted = true;
	  };
	};
  };

# 系统自动更新
	system.autoUpgrade.enable = false;
}
