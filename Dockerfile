FROM python:3.9-alpine

ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
ENV PROFILE default
ENV HTTPS_PROXY ""

COPY ./requirements.txt ./requirements.txt
RUN apk add --no-cache ffmpeg libmagic libwebp tzdata tiff freetype lcms2 \
    openjpeg openblas cairo py3-pip py3-numpy py3-pillow py3-cryptography \
    py3-decorator py3-olefile libffi-dev openssl-dev jpeg-dev libwebp-dev zlib-dev \
    python3-wheel webp libmagic-dev \
    && apk add --no-cache --virtual .build-deps git build-base gcc python3-dev \
    && pip3 install -r requirements.txt \
    && pip3 install -U git+https://github.com/milkice233/efb-qq-slave \
    && pip3 install git+https://github.com/XYenon/efb-qq-plugin-go-cqhttp \
    && pip3 install -U git+https://github.com/tedrolin/python-wechatPc \
    && pip3 install -U git+https://github.com/tedrolin/efb-wechat-pc-slave \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p ~/.ehforwarderbot/profiles/default \
    && rm -rf ~/.cache && rm ./requirements.txt\
    && apk del .build-deps


CMD ehforwarderbot