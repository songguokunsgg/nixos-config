{config, pkgs, ... }:

{
# home.packages 安装的软件，仅在当前用户下可用，不会影响系统级别的配置
	home.packages = with pkgs;[
	];
}
