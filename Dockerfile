FROM python:3.10-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai'

RUN apk add --no-cache ffmpeg libmagic libwebp git gcc jpeg-dev build-essential \
    && pip install --upgrade pip \
    && pip3 install ehforwarderbot \
    && pip3 install efb-telegram-master \
    && pip3 install -U git+https://github.com/milkice233/efb-qq-slave \
    && pip3 install git+https://github.com/XYenon/efb-qq-plugin-go-cqhttp \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf ~/.cache /var/cache/apk/*

CMD ehforwarderbot
