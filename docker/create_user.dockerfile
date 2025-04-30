FROM ros_humble:latest

# 安装必要的包
RUN apt-get install -y sudo passwd

# 创建新用户和用户组，指定相同的 UID 和 GID
RUN groupadd -g 1000 chunyu && useradd -r -u 1000 -g chunyu chunyu

# 设置用户密码
# RUN echo 'chunyu:21020421' | chpasswd

# 给新用户添加 sudo 权限（如果需要）
RUN usermod -aG sudo chunyu

# 配置 sudoers 文件，允许 'chunyu' 用户无需密码执行任何命令
RUN echo 'chunyu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/90-chunyu-nopasswd

# 切换到新创建的用户
USER chunyu

# 创建工作目录并设置权限
RUN sudo mkdir -p /home/chunyu && sudo chown -R chunyu:chunyu /home/chunyu

# 设置工作目录
WORKDIR /home/chunyu




