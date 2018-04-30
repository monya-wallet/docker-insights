FROM node:0.10.48

WORKDIR /

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential curl git nginx python unzip

RUN curl -LO https://github.com/BitzenyCoreDevelopers/bitzeny/releases/download/z2.0.1/bitzeny-2.0.1-x86_64-linux-gnu.tar.gz
RUN tar xvzf bitzeny-2.0.1-x86_64-linux-gnu.tar.gz
RUN cp /bitzeny-2.0.1/bin/bitzenyd /usr/local/bin/

RUN git clone --depth 1 https://github.com/BitzenyCoreDevelopers/insight-ui-bitzeny.git
RUN git clone --depth 1 https://github.com/BitzenyCoreDevelopers/insight-api-bitzeny.git
WORKDIR /insight-api-bitzeny
RUN npm install
WORKDIR /insight-ui-bitzeny

ENV INSIGHT_FORCE_RPC_SYNC=1
ENV INSIGHT_PUBLIC_PATH=public
ENV BITCOIND_USER=user
ENV BITCOIND_PASS=password
ENV INSIGHT_NETWORK=livenet
ENV INSIGHT_PORT=3000

EXPOSE 3000

CMD bitzenyd -daemon -bind=0.0.0.0 -checkblocks=24 -checklevel=0 -dbcache=64 -disablewallet -listen -maxconnections=64 -par=2 -port=9253 -rpcallowip=127.0.0.1 -rpcbind=127.0.0.1 -rpcport=9252 -server -whitelist=127.0.0.1 -rpcpassword=password -rpcuser=user;sleep 3;node /insight-api-bitzeny/insight.js


