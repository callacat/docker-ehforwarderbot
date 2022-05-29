FROM python:3.9-alpine

ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
ENV PROFILE default
ENV HTTPS_PROXY ""

RUN apk add --no-cache ffmpeg libmagic libwebp git tzdata gcc
RUN pip3 install ehforwarderbot efb-telegram-master efb-wechat-slave
RUN pip3 install -U git+https://github.com/milkice233/efb-qq-slave
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN mkdir -p ~/.ehforwarderbot/profiles/default

ENTRYPOINT ehforwarderbot