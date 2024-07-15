FROM docker://quay.io/podman/stable:latest

RUN dnf -y install openssh-server procps-ng

#RUN echo "root:password" | chpasswd

#RUN curl -o /root/.ssh/authorized_keys https://github.com/naokisz.keys
COPY authorized_keys /root/.ssh/authorized_keys
COPY authorized_keys /home/podman/.ssh/authorized_keys

COPY sshd_config /etc/ssh/sshd_config

EXPOSE 2222
