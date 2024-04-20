{config, pkgs, ...}:

{
	services.openssh = {
		enable = true;
		ports = [ 22 ];
# 可否使用密码登录
		settings = {
			PasswordAuthentication = false;
			KbdInteractiveAuthentication = false;
# 可否使用 root 登录
			PermitRootLogin = "no";
		};
	};

	users.users.sukipai.openssh.authorizedKeys.keys = [
		"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHDhb4hKYBKanR4/bYbTIWAf6VubqQhbItFp5u2CqZXycY2+Pj0IjJHgX89F5pMq5TekToMQ/SqDrtc35I1sWX6mBWgVjod3rRV0PawcHdc2dbSU2B+oV0fjSROlfOOStUqM/wv2hxR2L58R+vx2pm987iUSYBg28y6R8NXCP1DLjCQLt4iADZVmd/GikXSQrGW2x9q7rBVq3SDVSz9NiU+SsbCn7MpmnNwVUceYnxqTq2XZGX8lgrF6HhYILReyuMFxCfUoiDagghZBcHLZNojVq/ug6wFaYQaVNcalXn3joGmGueDc4/OILsnd9XIf3DonTgELaCji1Sh22jvUtdHhRzcZvW35EXz3Xhuki38oakL3f2W1QpC7rkdPXouHAGF9utOPweOZgzANyKQO0i20oHWt0ZAQwoEP0ZmMG1ISlxsuIbNrIq2LxDFCjyDvgrlEa0PzpygdeVlgauDSWZB7Dglh2iGPsoTkvfvz/LT7p3TwFekk5b18O+xUodxL0= SongguokunSgg"
	];
}
