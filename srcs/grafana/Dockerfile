FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add supervisor

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3000

COPY grafana.db /usr/share/grafana/data/grafana.db

COPY supervisor.conf /etc/supervisor.conf
CMD supervisord -c /etc/supervisor.conf