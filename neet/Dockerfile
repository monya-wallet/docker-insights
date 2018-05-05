FROM node:0.10.48

WORKDIR /home/node

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev libcurl4-openssl-dev curl libzip-dev

RUN git clone https://github.com/NEETCOINTeam/NEETCOIN.git
WORKDIR /home/node/NEETCOIN/src

RUN wget http://miniupnp.free.fr/files/miniupnpc-1.6.20120509.tar.gz -O miniupnpc.tar.gz
RUN tar -xzvf miniupnpc.tar.gz
WORKDIR /home/node/NEETCOIN/src/miniupnpc-1.6.20120509
RUN make
RUN make install
WORKDIR /home/node/NEETCOIN/src
RUN mkdir -p obj/zerocoin
WORKDIR /home/node/NEETCOIN/src/leveldb
RUN chmod 777 build_detect_platform

RUN make clean
RUN make libleveldb.a libmemenv.a
WORKDIR /home/node/NEETCOIN/src
RUN make -f makefile.unix

WORKDIR /home/node

RUN git clone https://github.com/MissMonacoin/insight-neetcoin.git
RUN git clone https://github.com/MissMonacoin/insight-api-neetcoin.git

WORKDIR /home/node/insight-api-neetcoin
RUN npm install

WORKDIR /home/node/insight-neetcoin

ENV INSIGHT_PUBLIC_PATH=public
ENV BITCOIND_USER=user
ENV BITCOIND_PASS=password
ENV BITCOIND_PORT=1919
ENV BITCOIND_P2P_PORT=21101
ENV INSIGHT_NETWORK=livenet
ENV INSIGHT_PORT=2110

EXPOSE 8100 24401

ENTRYPOINT /home/node/neetcoin/src/neetcoind -bind=0.0.0.0 -listen -maxconnections=64 -par=2 -rpcallowip=127.0.0.1 -rpcbind=127.0.0.1 -server -upnp -whitelist=127.0.0.1 -rpcuser=user -rpcpassword=password -rpcport=1919 -addnode=212.232.36.147 -daemon;sleep 15;node /home/node/insight-api-neetcoin/insight.js