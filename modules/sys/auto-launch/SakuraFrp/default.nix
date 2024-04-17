{config, pkgs, ...}:

# 内网穿透设置(SakuraFrp)
# sudo systemctl status SakuraFrp, 查看服务运行情况

let
	servicePath = "/etc/nixos/modules/sys/auto-launch/SakuraFrp";
in
{
	systemd.services.SakuraFrp = {
		enable = true;
		after = [ "network.target" ];
		wantedBy = [ "multi-user.target" ];
		description = "sakura 内网穿透";
		serviceConfig = {
			Type = "simple";
			ExecStart = "${servicePath}/frpc -c ${servicePath}/frpc.ini";
		};
	};
}
