{config, pkgs, ... }:

{
# 全局设置
	home-manager = {
		backupFileExtension = "backup";
	};

# 用户设置
	users = {
		defaultUserShell = pkgs.zsh;
		users.sukipai= {
			isNormalUser = true;
			hashedPassword = "$y$j9T$7ll8rfVlu/1vD0aJUbeYB/$OyMBmFx.F9.kmefPTNfOCZuwB6UEIG1sNWCek9wUNeD";
			extraGroups = [ "wheel" ];
			linger = true;
		};
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
