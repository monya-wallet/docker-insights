FROM node:0.10.48

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev libcurl4-openssl-dev curl libzip-dev

WORKDIR /home/node

RUN git clone https://github.com/yajucoin/yajucoin.git
WORKDIR /home/node/yajucoin/src

RUN wget http://miniupnp.free.fr/files/miniupnpc-1.6.20120509.tar.gz -O miniupnpc.tar.gz
RUN tar -xzvf miniupnpc.tar.gz
WORKDIR /home/node/yajucoin/src/miniupnpc-1.6.20120509
RUN make
RUN make install
WORKDIR /home/node/yajucoin/src
RUN mkdir -p obj/zerocoin
WORKDIR /home/node/yajucoin/src/leveldb
RUN chmod 777 build_detect_platform
RUN make clean
RUN make libleveldb.a libmemenv.a
WORKDIR /home/node/yajucoin/src
RUN make -f makefile.unix

WORKDIR /home/node

RUN git clone https://github.com/MissMonacoin/insight-yajucoin.git
RUN git clone https://github.com/MissMonacoin/insight-api-yajucoin

WORKDIR /home/node/insight-api-yajucoin

RUN npm i

WORKDIR /home/node/insight-yajucoin

# ADD yajuchain.tar.bz2 /root/

ENV INSIGHT_PUBLIC_PATH=public
ENV BITCOIND_USER=user
ENV BITCOIND_PASS=password
ENV BITCOIND_PORT=24402
ENV BITCOIND_P2P_PORT=24401
ENV INSIGHT_NETWORK=livenet
ENV INSIGHT_PORT=8100
ENV INSIGHT_FORCE_RPC_SYNC=1

EXPOSE 24401 8100

ENTRYPOINT /home/node/yajucoin/src/yajucoind -dns -bind=0.0.0.0 -listen -rpcallowip=127.0.0.1 -debug -staking=0 -rpcbind=0.0.0.0 -server -rpcuser=user -rpcpassword=password -addnode=212.232.36.147 -daemon; \
sleep 30; \
node /home/node/insight-api-yajucoin/insight.js
