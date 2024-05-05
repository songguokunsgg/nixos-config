{config, pkgs, ... }:

let
google_translate_ip = "216.239.32.40";
in
{
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
		extraHosts = ''
			${google_translate_ip} translate.googleapis.com
			${google_translate_ip} translate.google.cn
			${google_translate_ip} translate-pa.googleapis.com
			'';
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

		oci-containers = {
			backend = "podman";
			containers = {
# open-webui = import ./containers/open-webui.nix;
			};
		};
	};

# ollama 设置
# services.ollama.enable = true;
# system.activationScripts = {
#	script.text = ''
#		install -d -m 755 /home/sukipai/open-webui/data -o root -g root
#		'';
#};

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
	system.autoUpgrade.enable = false;
}
