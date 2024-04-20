{config, pkgs, ...}:


{
	fonts = {
		packages = with pkgs; [
			noto-fonts
# noto-fonts-cjk-sans
# noto-fonts-cjk-serif
				source-han-sans
				source-han-serif
				source-code-pro
				hack-font
				jetbrains-mono
				wqy_zenhei
				wqy_microhei
				fira
		];
# 简单配置一下 fontconfig 字体顺序，以免 fallback 到不想要的字体
		fontconfig = {
			defaultFonts = {
				emoji = [ "Noto Color Emoji" ];
				monospace = [
					"Fira Code"
						"Noto Sans Mono"
						"DejaVu Sans Mono"
				];
				sansSerif = [
					"WenQuanYi Micro Hei"
						"Noto Sans CJK SC"
						"DejaVu Sans"
				];
				serif = [
					"Noto Serif"
						"Source Han Serif SC"
						"DejaVu Serif"
				];
			};
		};
	};
}
