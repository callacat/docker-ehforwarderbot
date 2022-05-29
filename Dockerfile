FROM python:3.9-alpine

ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
ENV PROFILE default
ENV HTTPS_PROXY ""

RUN apk add --no-cache ffmpeg libmagic libwebp git tzdata \
&& pip3 install ehforwarderbot efb-telegram-master efb-wechat-slave \
&& pip3 install -U git+https://github.com/milkice233/efb-qq-slave \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone \
&& mkdir -p ~/.ehforwarderbot/profiles/default

ENTRYPOINT ehforwarderbot