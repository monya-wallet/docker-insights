FROM node:0.10.48

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install git

USER node

WORKDIR /home/node

RUN git clone https://github.com/MissMonacoin/insight-yajucoin.git
RUN git clone https://github.com/MissMonacoin/insight-api-yajucoin

WORKDIR /home/node/insight-api-yajucoin

RUN npm install

WORKDIR /home/node/insight-yajucoin

ENV INSIGHT_PUBLIC_PATH=public
ENV BITCOIND_USER=user
ENV BITCOIND_PASS=password
ENV BITCOIND_PORT=24402
ENV BITCOIND_P2P_PORT=24401
ENV INSIGHT_NETWORK=livenet
ENV INSIGHT_PORT=8100
ENV INSIGHT_FORCE_RPC_SYNC=1

mkdir /home/node/.insight-yajucoin

EXPOSE 8100

ENTRYPOINT node /home/node/insight-api-yajucoin/insight.js
