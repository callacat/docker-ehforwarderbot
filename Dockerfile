FROM python:3.9-alpine

ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'
ENV PROFILE default
ENV HTTPS_PROXY ""

COPY ./requirements.txt ./requirements.txt
RUN apk add --no-cache ffmpeg libmagic libwebp git tzdata gcc tiff freetype lcms2 openjpeg openblas cairo py3-pip py3-numpy py3-pillow py3-cryptography py3-decorator py3-olefile build-base libffi-dev openssl-dev jpeg-dev libwebp-dev zlib-dev
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
RUN pip3 install -U git+https://github.com/milkice233/efb-qq-slave
RUN pip3 install git+https://github.com/XYenon/efb-qq-plugin-go-cqhttp
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN mkdir -p ~/.ehforwarderbot/profiles/default

ENTRYPOINT ehforwarderbot