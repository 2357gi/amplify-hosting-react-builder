FROM amazonlinux:2

# UTF-8 Environment
ENV LANGUAGE en_US:en
ENV LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN touch ~/.bashrc
RUN yum -y update && \
    yum -y install \
        unzip \
        git \
        openssl-devel \
        openssh-clients \
    yum clean all && \
    rm -rf /var/cache/yum

RUN /bin/bash -c "curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip' && \
    unzip awscliv2.zip && \
    ./aws/install"

RUN /bin/bash -c "curl -sL https://rpm.nodesource.com/setup_14.x | bash -" && \
    yum -y install \
        nodejs \
        npm \
        yarn \
    yum clean all && \
    rm -rf /var/cache/yum

RUN npm install -g @aws-amplify/cli

