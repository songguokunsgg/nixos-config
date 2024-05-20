{config, pkgs, ... }:

{
# 软件包设置
	environment.systemPackages = with pkgs; [
		cockpit
		hydra-check
		home-manager
		git
		wget
		virtiofsd
		pciutils
		zip
		xz
		unzip
		tmux
		tree
	];
}
