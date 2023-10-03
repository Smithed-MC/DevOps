FROM python:3.10.13-alpine

RUN apk update
RUN apk add git nodejs gcc
# RUN apk add python3
# RUN apk --update add gcc libc-dev libffi-dev build-base freetype-dev libpng-dev openblas-dev
# RUN apk add gfortran
# RUN apk add py3-pip
# RUN apk add py3-numpy

RUN pip3 install --upgrade pip
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