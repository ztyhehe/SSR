FROM debian:jessie
MAINTAINER zhangtianyuan <zhang_tianyuan@topsec.com.cn>

ENV TZ Asia/Shanghai

COPY ./sources.list /etc/apt/

RUN apt-get update && apt-get install -y \
    python-pip git

RUN git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git

WORKDIR /shadowsocksr
RUN bash ./initcfg.sh

EXPOSE 8089

CMD ["python", "./shadowsocks/server.py", "-p", "8089", "-k", "password", "-m", "aes-256-cfb", "-O", "auth_sha1_v4", "-o", "http_simple"]
