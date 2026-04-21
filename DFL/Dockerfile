FROM debian:stable-slim 

LABEL Maintainer="CatDEV <dev.catnet@gmail.com>"

### ENV 
ENV TZ=America/Guatemala

### COPY
COPY ./PRC/motd /etc/motd
COPY ./PRC/profile /etc/profile
COPY ./PRC/authorized_keys /root/.ssh/authorized_keys
COPY SCP /SCP

### [ RUN ]
### [!]: Replace \ + && with ;\
RUN set -eux ;\
### Set DEBIAN_FRONTEND to noninteractive
	DEBIAN_FRONTEND=noninteractive ;\
### Install Basic Packages
    apt update ;\
    apt -y -q install --no-install-recommends \
        supervisor \
        wget \
		curl \
		ca-certificates \
		nano \
		gpg \
		dirmngr \
        tzdata \
        openssh-server ;\
### Setting SSH
		mkdir -p "/var/run/sshd" ;\
		adduser admin ;\
		id admin ;\
		ls -lad /home/admin/ ;\
		echo 'root:Shaka.66' | chpasswd ;\
		sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config ;\
### Setting the Timezone
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone ;\
### Set authorized_keys 
    chmod 700 /root/.ssh ;\
    chmod 600 /root/.ssh/authorized_keys ;\
### Set Script Dir
    chmod +x /SCP/* ;\
### Set COM Dir
    mkdir /COM ;\
    chmod -R 777 /COM ;\
### Clean [!]
    /SCP/clean.sh

### [ EXPOSE ]
EXPOSE 22

### [ CMD ]
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]