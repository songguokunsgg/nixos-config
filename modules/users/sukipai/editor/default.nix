{lib, ...}:

{
	home.file.".vim/tasks.ini".source = ./tasks.ini;
	home.file.".local/share/nvim/site/autoload/plug.vim".source = ./plug.vim;
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		extraConfig = lib.fileContents ./plugConfig.vim + lib.fileContents ../../../editor/config.vim;
	};
}
