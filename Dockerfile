FROM python:3.9-alpine

ENV LANG C.UTF-8 \
    TZ 'Asia/Shanghai' \
    PROFILE default \
    HTTPS_PROXY ""

RUN apk add --no-cache ffmpeg libmagic libwebp tzdata tiff freetype \
        lcms2 openjpeg openblas cairo py3-pip py3-numpy py3-pillow \
        py3-cryptography py3-decorator py3-olefile libffi-dev \
        openssl-dev jpeg-dev libwebp-dev zlib-dev \
    && apk add --no-cache --virtual .build-deps git build-base gcc python3-dev \
    && pip3 install ehforwarderbot \
    && pip3 install efb-telegram-master \
    && pip3 install efb-wechat-slave \
    && pip3 install -U git+https://github.com/milkice233/efb-qq-slave \
    && pip3 install git+https://github.com/XYenon/efb-qq-plugin-go-cqhttp \
    && pip3 install -U git+https://github.com/tedrolin/python-wechatPc \
    && pip3 install -U git+https://github.com/tedrolin/efb-wechat-pc-slave \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf ~/.cache \
    && apk del .build-deps

CMD ehforwarderbot