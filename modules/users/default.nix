{config, pkgs, ... }:

{
# 用户设置
	users.users.sukipai= {
		isNormalUser = true;
		extraGroups = [ "wheel" "docker" "libvirtd" ];
		shell = pkgs.zsh;
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
