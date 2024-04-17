{config, pkgs, lib, ...}:

{
	services.flatpak = {
		remotes = lib.mkOptionDefault [{
			name = "flathub-beta";
			location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
		}];
		packages = [
			"com.tencent.WeChat"
		];
		overrides = {
			global = {
# 强制使用 wayland
				Context.sockets = ["wayland" "!x11" "!fallback-x11"];
				Environment = {
					XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
					XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
					GTK_THEME = "Adwaita:dark";
				};
			};
# 不支持 wayland 的应用
			"com.tencent.WeChat".Context.sockets = ["x11"];	
		};
	};
}
