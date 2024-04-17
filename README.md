# 家中常备使用说明

## 切换 unstable 的方法

1. 修改 flake.nix，pkgurl 的 23.11 改为 unstable
2. nix-channel --add https://channels.nixos.org/nixos-unstable nixos
3. nix-channel --update
4. 修改 home manager 版本：将 flake.nix 中的 release-23.11 类似的改为 master
4. 修改 home.nix ：将 home.stateVersion 改为 "24.05"
7. nixos-rebuild switch --upgrade

## 从 unstable 改回 stable

把上面的反着走一遍即可

## 代理使用方法

安装 clash-verge 或者 clash-verge-rev

由于权限问题，两者并不能直接使用，图形界面和clash内核需要分开启动。

1. 首先，需要从命令行启动配置文件

```bash
sudo clash-meta -f config.yaml
```

如果要启用TUN模式，则这里必须 sudo。

2. 启动软件，然后使用和一般软件无异

## 子仓库 vim-plug

本来是为了方便更新vim-plug 添加的，但是nix 访问不到这个子仓库的文件，软连接出来一层也不行，所以只能手动将更新后的plug.vim 复制到上一层使用。

git clone 的时候要带着子仓库一起使用的话，需要用以下命令

```bash
git clone --recurse-submodules [repoURL]
```

也就是

```bash
git clone --recurse-submodules https://github.com/junegunn/vim-plug.git
```

只 clone 主仓库的话，vim-plug 文件夹为空

也就是说，子仓库需要单独进行管理，在主仓库中以二进制形式存储（可能这也是nix读不到内容的原因，被当成二进制了）。
