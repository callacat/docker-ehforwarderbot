FROM alpine:latest

ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
ENV PROFILE default
ENV HTTPS_PROXY ""

RUN apk add --no-cache tzdata ca-certificates \
        ffmpeg libmagic python3 \
        tiff libwebp freetype lcms2 openjpeg py3-olefile openblas \
        py3-numpy py3-pillow py3-cryptography py3-decorator cairo py3-pip \
    && apk add --no-cache --virtual .build-deps git gcc python3-dev \
    && pip install --upgrade pip \
    && pip3 install ehforwarderbot efb-telegram-master efb-wechat-slave \
    && pip3 install -U git+https://github.com/milkice233/efb-qq-slave \
    && pip3 install git+https://github.com/XYenon/efb-qq-plugin-go-cqhttp \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p ~/.ehforwarderbot/profiles/default \
    && apk del .build-deps && rm -rf ~/.cache

ENTRYPOINT ehforwarderbot