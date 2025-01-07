# 使用说明

## 分支

* main：包含Base配置，可作个人 Server 使用

## 安装系统

### 分区并创建配置文件

根据官方教程进行，但分区使用 cfdisk 工具，更简单

仓本库中的 hardware-configuration.nix 是不可复用的，必须替换为实际的分区目标

由于本仓库使用 unstable，并且不使用国内源安装，所以必须想办法连接 github

### 升级 channel

```bash
nix-channel --add https://channels.nixos.org/nixos-unstable nixos
nix-channel --update
```

### 安装系统

```bash
nixos-install
```

如果出现异常，可以先注释掉 `./configuration.nix` 中的 desktop 图形界面

命令行安装完成后，重启系统、取消注释 desktop，再 `update` 安装一次图形界面

## 升级系统

如果不使用 flake 的话，直接

```bash
sudo nixos-rebuild switch --upgrade
```

但我是个 SB，用了 flake 必须要

```bash
# 升级 flake
sudo nix flake update --flake /etc/nixos
# 根据 flake 安装或升级包，并产生一个新的世代
sudo nixos-rebuild switch
```

已经添加了 alias 到 zshrc，直接 `update` 即可一键升级

**所以我用 flake 是图个啥**

## 软件源相关

### 配置过程中切换到 unstable 采用的方案

1. 修改 flake.nix，pkgurl 的 23.11 改为 unstable
2. `nix-channel --add https://channels.nixos.org/nixos-unstable nixos`
3. `nix-channel --update`
4. 修改 home manager 版本：将 flake.nix 中类似 release-23.11 的内容改为 master
5. 修改 home.nix：将 home.stateVersion 改为 "24.05"
6. `update` 即可

### 切换回 stable

如果出现软件不兼容再考虑切换，一般都用 unstable

## 代理使用方法

安装 clash-verge 或者 clash-verge-rev（这个软件目前有些 UI 上的问题，建议 clash-verge）

由于权限问题，两者并不能直接使用，图形界面和 clash 内核需要分开启动。

1. 首先，需要从命令行启动配置文件

```bash
sudo clash-meta -f config.yaml
```

如果要启用 TUN 模式，则这里必须 sudo。

2. 启动软件，然后使用和一般软件无异

## 子仓库 vim-plug

本来是为了方便更新 vim-plug 添加的，但是 nix 访问不到这个子仓库的文件，软连接出来一层也不行，所以只能手动将更新后的 plug.vim 复制到上一层使用。

git clone 的时候要带着子仓库一起使用的话，需要用以下命令

```bash
git clone --recurse-submodules [repoURL]
```

也就是

```bash
git clone --recurse-submodules https://github.com/junegunn/vim-plug.git
```

只 clone 主仓库的话，vim-plug 文件夹为空

也就是说，子仓库需要单独进行管理，在主仓库中以二进制形式存储（可能这也是 nix 读不到内容的原因，被当成二进制了）。

## 关于 KVM 虚拟化的说明

属实是把我坑了，搞了好几天才解决，其实很简单。

### 启用 opengl

见 `modules/sys/default.nix` 文件，已经配置好。

### win 虚拟机安装 virtio 驱动

磁盘直接选成 virtio

需要在**安装系统**的时候加载驱动

**不可以**先安装系统再加载驱动！

### win 虚拟机配置

1. 显示协议 Spice：Listen Type：None；OpenGL：打勾
2. 显卡 Virtio：打开 3D Accelerate

## Fcitx5 输入法的配置

不用添加任何环境变量，只需要在 `设置-虚拟键盘-Fcitx5` 选中然后重启，即可启用 Electron 应用的 `--enable-wayland-ime` 作用。

## 字体说明

主要定义在 `modules/packages/fonts.nix` 下面

但是有些闭源字体无法通过包管理安装（如 Times New Roman，Hack Nerd Font,Arial），需要把字体文件放在 `~/.local/share/fonts/` 下，然后

```bash
fc-cache -fsv
```

就可以使用该字体了