FROM node:18.17.1-alpine

RUN apk update
RUN apk add git

COPY . .


ENV BRANCH=master

RUN git clone https://github.com/Smithed-MC/UX -b $BRANCH code
WORKDIR /code

RUN npm i -g turbo-linux-arm64 turbo
RUN npm i -g typescript


RUN npm i --platform=linux --arch=arm64 turbo@^1.10.12

COPY ./secret.json /code/platforms/api/

EXPOSE ${PORT}

ENV ADMIN_CERT=./secret.json

CMD ["npm", "run", "api:dev"]