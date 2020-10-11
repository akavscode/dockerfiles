FROM ubuntu:focal

ENV KEY **None**

RUN apt-get update \
    && sed -i "s/http:\/\/archive.ubuntu.com/https:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
    && apt-get install -y --no-install-recommends openssh-server nano curl wget build-essential \
    && mkdir -p /var/run/sshd \
    && sed -i "s/PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
    && sed -i "s/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/g" /etc/ssh/sshd_config

ADD run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 22
CMD ["/run.sh"]
