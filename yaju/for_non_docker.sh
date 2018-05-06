cd $HOME

apt-get update
apt-get -y upgrade

apt-get -y install ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev libcurl4-openssl-dev curl libzip-dev

git clone https://github.com/yajucoin/yajucoin.git
cd $HOME/yajucoin/src

wget http://miniupnp.free.fr/files/miniupnpc-1.6.20120509.tar.gz -O miniupnpc.tar.gz
tar -xzvf miniupnpc.tar.gz
cd $HOME/yajucoin/src/miniupnpc-1.6.20120509
make
make install
cd $HOME/yajucoin/src
mkdir -p obj/zerocoin
cd $HOME/yajucoin/src/leveldb
chmod 777 build_detect_platform

make clean
make libleveldb.a libmemenv.a
cd $HOME/yajucoin/src
make -f makefile.unix

cd $HOME

git clone https://github.com/MissMonacoin/insight-yajucoin.git
git clone https://github.com/MissMonacoin/insight-api-yajucoin

cd $HOME/insight-api-yajucoin
npm install

cd $HOME/insight-yajucoin

export INSIGHT_PUBLIC_PATH=public
export BITCOIND_USER=user
export BITCOIND_PASS=password
export BITCOIND_PORT=24402
export BITCOIND_P2P_PORT=24401
export INSIGHT_NETWORK=livenet
export INSIGHT_PORT=8100


$HOME/yajucoin/src/yajucoind -bind=0.0.0.0 -listen -maxconnections=64 -par=2 -rpcallowip=127.0.0.1 -rpcbind=127.0.0.1 -server -upnp -whitelist=127.0.0.1 -rpcuser=user -rpcpassword=password -addnode=212.232.36.147 -daemon;
sleep 15;
node $HOME/insight-api-yajucoin/insight.js
