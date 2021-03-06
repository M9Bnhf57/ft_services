FROM alpine

ENV FTP_USER=admin \
    FTP_PASS=admin

RUN apk update
RUN apk upgrade
RUN apk add vsftpd
RUN apk add openssl
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add supervisor

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN addgroup -g 433 -S $FTP_USER
RUN adduser -u 431 -D -G $FTP_USER -h /home/$FTP_USER -s /bin/false  $FTP_USER
RUN echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
RUN chown $FTP_USER:$FTP_USER /home/$FTP_USER/ -R

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=RUSSIA/L=MOSCOW/O=42/OU=school/CN=kdustin" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

EXPOSE 21

COPY supervisor.conf /etc/supervisor.conf
CMD supervisord -c /etc/supervisor.conf