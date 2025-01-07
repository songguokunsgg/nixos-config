{config, pkgs, ... }:

{
# 软件包设置
	environment.systemPackages = with pkgs; [
		home-manager
		git
		wget
		curl
		vscode-fhs
	];
}