FROM node:18.17.1-alpine

RUN apk update
RUN apk add git
RUN apk add python3
RUN apk add gcc
RUN apk add py3-pip

RUN pip3 install smithed

COPY . .


ENV BRANCH=master


RUN git clone https://github.com/Smithed-MC/UX -b $BRANCH code
WORKDIR /code

ARG ARCH x64

RUN npm i -g turbo-linux-${ARCH} turbo
RUN npm i -g typescript


RUN npm i --platform=linux --arch=${ARCH} turbo@^1.10.12

COPY ./secret.json /code/platforms/api/

EXPOSE ${PORT}

ENV ADMIN_CERT=./secret.json

CMD ["npm", "run", "api:dev"]