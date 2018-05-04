FROM node:0.10.48

WORKDIR /home/node

RUN apt-get -y install build-essential curl git

RUN apt-get update
RUN apt-get -y upgrade

COPY yajucoind yajucoind

RUN ./yajucoind -bind=0.0.0.0 -listen=1 -maxconnections=8 -par=2 -rpcallowip=127.0.0.1 -rpcbind=127.0.0.1 -server=1 -upnp=1 -whitelist=127.0.0.1 -rpcuser=user -rpcpassword=password -rpcport=1919 -port=4545 -addnode=212.232.36.147
RUN git clone https://github.com/MissMonacoin/insight-yajucoin.git
RUN git clone https://github.com/MissMonacoin/insight-api-yajucoin

WORKDIR /home/node/insight-api-yajucoin
RUN npm install

WORKDIR /home/node/insight-yajucoin

ENV INSIGHT_PUBLIC_PATH=public
ENV BITCOIND_USER=user
ENV BITCOIND_PASS=password
ENV INSIGHT_NETWORK=livenet
ENV INSIGHT_PORT=8100

EXPOSE 8100

ENTRYPOINT node /insight-api-yajucoin/insight.js