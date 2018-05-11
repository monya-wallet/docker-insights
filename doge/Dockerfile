FROM node:0.10.48

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential libtool git autotools-dev autoconf pkg-config libssl-dev libboost-all-dev hexdump

WORKDIR /root

RUN git clone https://github.com/dogecoin/dogecoin.git

WORKDIR /root/dogecoin

RUN ./autogen.sh
RUN ./configure --without-miniupnpc --disable-wallet --disable-tests
RUN make
RUN make install

EXPOSE 11111

# config
ENV NODE_ENV production
ENV BITCOIND_PORT 22555
ENV BITCOIND_P2P_PORT 22556
ENV BITCOIND_USER user
ENV BITCOIND_PASS pass
ENV INSIGHT_NETWORK livenet
ENV INSIGHT_PORT 11111
# Path where to store insight's internal DB. (defaults to $HOME/.insight)
ENV INSIGHT_DB /root/data

ADD . /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/Dogeparty/insight-doge-api.git
WORKDIR /usr/src/app/insight-doge-api
RUN npm install

CMD dogecoind -server -rpcuser=user -rpcpassword=password -daemon -debug -rpcallowip=127.0.0.1 -dns -bind=0.0.0.0 -listen ;sleep 5; node insight.js