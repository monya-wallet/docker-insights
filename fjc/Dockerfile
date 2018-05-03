FROM node:0.10.48

WORKDIR /home/node

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install curl git

RUN git clone https://github.com/fujicoin/insight-fjc.git
RUN mv insight-fjc/fujicoin-bitcore.tar.gz .
RUN tar -zxvf fujicoin-bitcore.tar.gz
RUN mkdir .fujicoin
RUN mv insight-fjc/fujicoin.conf .fujicoin
RUN ./fujicoin-bitcore/fujicoind -daemon -bind=0.0.0.0 -checkblocks=24 -checklevel=0 -dbcache=64 -disablewallet -listen -maxconnections=64 -par=2 -port=9253 -rpcallowip=127.0.0.1 -rpcbind=127.0.0.1 -rpcport=9252 -server -whitelist=127.0.0.1 -rpcpassword=password -rpcuser=user 

CMD insight-fjc/node_modules/bitcore-node/bin/bitcore-node start
EXPOSE 3001