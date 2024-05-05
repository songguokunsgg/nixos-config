{config, pkgs, lib, ...}:

{
	services.flatpak = {
		remotes = lib.mkOptionDefault [{
			name = "flathub-beta";
			location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
		}];
		packages = [
			"com.tencent.WeChat"
				"com.valvesoftware.Steam"
				"com.baidu.NetDisk"
				"org.ppsspp.PPSSPP"
				{ appId = "com.jetbrains.IntelliJ-IDEA-Ultimate"; origin = "flathub";  }
		];
		overrides = {
			global = {
# 强制使用 wayland
				Context.sockets = ["wayland" "x11" "!fallback-x11"];
				Environment = {
					XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
					XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
					GTK_THEME = "Adwaita:dark";
				};
			};
# 强制应用程序使用 x11 或 wayland, 示例:
# "com.tencent.WeChat".Context.sockets = ["x11"];	
		};
	};
}
