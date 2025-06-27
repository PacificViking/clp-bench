# This file is used for building the container, ensuring installation of the required tool and
# dependencies

# If there is any dedicated image available, you should build the benchmarking image on top of that
# FROM ghcr.io/y-scope/clp/clp-core-dependencies-x86-ubuntu-jammy:main
FROM presto/prestissimo-dependency:ubuntu-22.04
# FROM presto/prestissimo-dependency:latest
# FROM prestodb/presto-native-dependency:latest

# Install necessary packages
RUN apt-get update;

# RUN apt-get install -y \
#     tmux \
#     vim \
#     libsnappy-dev \
#     libdouble-conversion-dev \
#     libre2-dev \
#     libgflags-dev \
#     libboost-all-dev;

# Install necessary packages (alphabetized)
RUN apt-get install -y \
    bash \
    build-essential \
    ca-certificates \
    curl \
    gdb \
    git \
    lsb-release \
    mariadb-client \
    maven \
    net-tools \
    netcat \
    openjdk-11-jdk \
    openssh-server \
    python3 \
    python3-pip \
    rsync \
    software-properties-common \
    sudo \
    tmux \
    unzip \
    vim \
    wget \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*;

# Install Task
RUN cd /usr/local && sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d;

RUN pip3 install pyarrow;

RUN mkdir -p /home/pacificviking-dev/presto/hive-data;

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Set up SSH port
EXPOSE 22
