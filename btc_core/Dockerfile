FROM node:0.10.48

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev libcurl4-openssl-dev curl libzip-dev

WORKDIR /root

RUN npm install -g bitcore@latest

EXPOSE 3001
ENTRYPOINT bitcored start
