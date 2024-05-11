{config, pkgs, ... }:

{
# 全局设置
	home-manager = {
		backupFileExtension = "backup";
	};
# 用户设置
	users.users.sukipai= {
		isNormalUser = true;
		extraGroups = [ "wheel" "docker" "libvirtd" ];
		shell = pkgs.zsh;
		linger = true;
	};

# 设置为 NOPASSWD
	security.sudo.extraRules = [
	{
		users = [ "sukipai" ];
		commands = [
		{ 
			command = "ALL" ;
			options= [ "NOPASSWD" ];
		}
		];
	}
	];
}
