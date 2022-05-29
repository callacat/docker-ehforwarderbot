FROM python:3.9-alpine

ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
ENV PROFILE default
ENV HTTPS_PROXY ""

RUN apk add --no-cache ffmpeg libmagic libwebp tzdata py3-pillow py3-cryptography py3-decorator \
    && apk add --no-cache --virtual .build-deps git gcc \
    && pip install --upgrade pip \
    && pip3 install ehforwarderbot efb-telegram-master efb-wechat-slave \
    && pip3 install -U git+https://github.com/milkice233/efb-qq-slave \
    && pip3 install git+https://github.com/XYenon/efb-qq-plugin-go-cqhttp \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p ~/.ehforwarderbot/profiles/default \
    && apk del .build-deps && rm -rf ~/.cache

ENTRYPOINT ehforwarderbot