{ config, lib, pkgs, ... }:

{
	imports =
		[
		./hardware-configuration.nix
		./modules/sys/default.nix
		./modules/ssh/default.nix
		./modules/users/default.nix
		./modules/editor/default.nix
		./modules/packages/default.nix
		];

# 不要修改!!
	system.stateVersion = "25.05";
}

