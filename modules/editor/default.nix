{config, pkgs, lib, ... }:

{
# 编辑器设置
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		configure = {
			customRC = lib.fileContents ./config.vim;
		};
	};
}
