FROM debian:9

RUN apt-get update && apt-get install -y git apache2 bc build-essential cpp curl g++ gawk gcc genisoimage gzip htmldoc isolinux lftp libapache2-mod-php7.0 libc6 libcurl3 liblzma-dev m4 mysql-client mysql-server net-tools nfs-kernel-server openssh-server php-gettext php7.0 php7.0-bcmath php7.0-cli php7.0-curl php7.0-fpm php7.0-gd php7.0-json php7.0-mbstring php7.0-mysql sysv-rc-conf tar tftp-hpa tftpd-hpa unzip vsftpd wget xinetd zlib1g
RUN git clone https://github.com/FOGProject/fogproject.git

COPY fogsettings /opt/fog/.fogsettings
WORKDIR /fogproject

RUN sed '/start-stop-daemon/ a \\t\tsleep 1' /etc/init.d/vsftpd > /etc/init.d/vsftpd

RUN ./bin/installfog.sh -y

CMD ["/bin/bash", "-c", "service php7.0-fpm start && service tftpd-hpa start && service vsftpd start && service mysql start && apache2ctl -D FOREGROUND"]
