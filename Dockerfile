FROM python:3.8.12-bullseye

RUN mkdir /build

WORKDIR /build

RUN git clone https://github.com/kalidasya/scapy-ssl_tls.git; cd scapy-ssl_tls; git checkout py3_update; python3 setup.py install
RUN pip install protobuf
RUN apt update; apt install -y libpcap0.8

WORKDIR /build

RUN git clone https://github.com/Samsung/cotopaxi; cd cotopaxi; python setup.py install; pip install -e .[ml]

