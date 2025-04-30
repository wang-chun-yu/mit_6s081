# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:20.04

# 设置环境变量，防止交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包并安装常用工具
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        sudo \
        curl \
        wget \
        vim \
        git \
        ca-certificates \
        tzdata \
        net-tools \
        iputils-ping \
        gnupg \
        lsb-release \
    && rm -rf /var/lib/apt/lists/*

# 设置默认时区为 Asia/Shanghai（可按需更改）
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# 创建一个非 root 用户（可选）
ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 切换到新用户
USER $USERNAME
WORKDIR /home/$USERNAME

# 设置容器默认启动命令
CMD ["/bin/bash"]
