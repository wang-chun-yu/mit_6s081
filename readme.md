[TOC]
# 参考资料
- 官方文档：https://pdos.csail.mit.edu/6.828/2020/schedule.html
- xv6-x86版本翻译：https://github.com/ranxian/xv6-chinese
# 实验准备工作
## 构建镜像
docker build --network host -f base.dockerfile . -t mit_6s081:latest
## 创建容器
./scripts/mit_6s081_run.sh
## 运行容器
./scripts/mit_6s081_into.sh
## 安装依赖
sudo apt update
sudo apt-get install git build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu 
sudo apt-get remove qemu-system-misc
sudo apt-get install qemu-system-misc=1:4.2-3ubuntu6
## 下载xv6源码
git clone git://g.csail.mit.edu/xv6-labs-2020
git checkout util
## 验证
cd xv6-labs-2020
make qemu
