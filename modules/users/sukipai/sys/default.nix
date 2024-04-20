{config, pkgs, lib, ...}:

{
	dconf.settings = {
		"org/virt-manager/virt-manager/connections" = {
			autoconnect = ["qemu:///system"];
			uris = ["qemu:///system"];
		};
	};
# 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
	home.file.".profile".text = ''
		export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
		'';
}
