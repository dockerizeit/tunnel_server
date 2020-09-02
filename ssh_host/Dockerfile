FROM ubuntu:12.04
MAINTAINER dockerizeit@1uptalent.com

RUN apt-get update
RUN apt-get install -y openssh-server

ADD launch.sh /
RUN mkdir /var/run/sshd

RUN adduser tunnel
RUN usermod -s /bin/false tunnel

# config SSH

# this allow traffic from outside to reach "remote forwards" (ssh -R)
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config
RUN echo "AllowUsers tunnel" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "AllowTcpForwarding remote" >> /etc/ssh/sshd_config

# TODO: close the firewall, users inside this container should not be able
# contact anything outside. Only incomming connections to port 22 and 8000
# must be enabled

EXPOSE 22
EXPOSE 8000

CMD ./launch.sh
