FROM node:4.9.1

WORKDIR /home/node

RUN apt-get update
RUN apt-get -y dist-upgrade

RUN apt-get -y install build-essential curl git libzmq3-dbg libzmq3-dev libzmq3

RUN git clone https://github.com/fujicoin/insight-fjc.git
RUN wget http://www.fujicoin.org/fujicoin/3.0/fujicoin-3.0-v0.15.3.0.tar.gz
RUN tar -zxvf fujicoin-3.0-v0.15.3.0.tar.gz
RUN mkdir .fujicoin


WORKDIR /home/node/insight-fjc/node_modules/bitcore-node
RUN chmod 777 bin/bitcore-node 
RUN npm install zmq

RUN mkdir /root/.fujicoin
ADD fujicoin.conf /root/.fujicoin/

WORKDIR /home/node/insight-fjc

ADD bitcore-node.json .

CMD node_modules/bitcore-node/bin/bitcore-node start
EXPOSE 3001