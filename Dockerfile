FROM python:3.10-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai'

RUN apk add --no-cache ffmpeg libmagic libwebp \
    && pip3 install ehforwarderbot \
       -U git+https://github.com/ehForwarderBot/efb-telegram-master \
       -U git+https://github.com/milkice233/efb-qq-slave \
       -U git+https://github.com/XYenon/efb-qq-plugin-go-cqhttp \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf ~/.cache /var/cache/apk/*

CMD ehforwarderbot
