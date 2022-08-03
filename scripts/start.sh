#!/bin/bash
cd "$(dirname "$0")"

if [[ -f "/config/lighthouse.yml" ]]
then
    cp /config/lighthouse.yml ./lighthouse.yml
else
    if [[ ! -d "/config" ]]
    then
        mkdir /config
    fi
    cp ./lighthouse.yml.default /config/lighthouse.yml
    cp ./lighthouse.yml.default ./lighthouse.yml
fi

if [[ ! -d "/logs" ]]
then
    mkdir /logs
fi

./LBPUnion.ProjectLighthouse.Servers.API >> /logs/ApiServer.log &
./LBPUnion.ProjectLighthouse.Servers.GameServer | tee /logs/GameServer.log | tee "$(tty)" &
./LBPUnion.ProjectLighthouse.Servers.Website >> /logs/WebsiteServer.log