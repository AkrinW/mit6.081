FROM ubuntu:22.04
# WORKDIR /bustub
# COPY . /cmu-15445

ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装 SQLite 和其他必要的工具
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    cmake \
    doxygen \
    gdb \
    git \
    pkg-config \
    zlib1g-dev \
    libelf-dev \
    libdwarf-dev \
    vim \
    wget \
    curl \
    python3 \
    sudo \
    zip \
    openssh-client \
    gdb-multiarch \
    qemu-system-misc \
    gcc-riscv64-linux-gnu \
    binutils-riscv64-linux-gnu \
    && rm -rf /var/lib/apt/lists/*


# Copy the SSH private key and set the correct permissions
# Replace 'your_private_key' with the actual private key file path

# Set working directory
WORKDIR /root

# Copy the SSH private key and set the correct permissions
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# COPY CMakeLists.txt /home
# COPY id_rsa.txt /home/devuser/.ssh/id_rsa
# RUN chmod 600 /home/devuser/.ssh/id_rsa

# Add GitHub's SSH key to known_hosts to prevent host authenticity prompt
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# git clone bustub
# RUN git clone https://github.com/AkrinW/.git
# using ssh
RUN git clone git@github.com:AkrinW/mit6.081.git


# 设置默认命令为 bash
CMD ["/bin/bash"]

# build command
# docker build --network=host -t <imagename> .
# docker build --network=host -t bustub-dev .

# run container
# docker run -it --rm <imagename>
# docker run -it bustub-dev
# docker run -it --name <container> <image>
# 列出所有容器
# docker ps -a
# docker start <container>
