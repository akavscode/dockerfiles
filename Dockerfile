FROM ubuntu:focal

ENV KEY **None**

RUN apt-get update && apt-get install -y openssh-server \
    && mkdir -p /var/run/sshd \
    && sed -i "s/PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
    && sed -i "s/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/g" /etc/ssh/sshd_config

ADD run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 22
CMD ["/run.sh"]
