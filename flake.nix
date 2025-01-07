{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ nixpkgs, home-manager, ... }: {
		nixosConfigurations = {
# 这里替换成你的主机名
			nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
						./configuration.nix

# 将 home-manager 配置为 nixos 的一个 module
						home-manager.nixosModules.home-manager
						{
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;

# 这里替换成用户名
							home-manager.users.sukipai= import ./home.nix;

# 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
# 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
# home-manager.extraSpecialArgs = inputs;
						}
				];
			};
		};
	};
}
