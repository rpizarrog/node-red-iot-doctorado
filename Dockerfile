FROM nodered/node-red:latest

COPY package.json /data/package.json

RUN cd /data && npm install --omit=dev

COPY flows.json /data/flows.json