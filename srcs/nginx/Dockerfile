FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add openssh
RUN apk add supervisor

RUN adduser -D kdustin
RUN echo "kdustin:admin" | chpasswd
RUN ssh-keygen -A

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir /working_dir
RUN mkdir /run/nginx
WORKDIR /working_dir
COPY . /working_dir
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv nginx.conf /etc/nginx/nginx.conf
RUN mv index.html /www/index.html

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=RUSSIA/L=MOSCOW/O=42/OU=school/CN=kdustin" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

EXPOSE 80
EXPOSE 443
EXPOSE 22

COPY supervisor.conf /etc/supervisor.conf
CMD supervisord -c /etc/supervisor.conf