FROM ubuntu:latest

# RUN apt-get update
# RUN apt-get add git nodejs gcc
# # RUN apk add python3
# # RUN apk --update add gcc libc-dev libffi-dev build-base freetype-dev libpng-dev openblas-dev
# # RUN apk add gfortran
# # RUN apk add py3-pip
# # RUN apk add py3-numpy

# RUN apt-get install python
RUN apt update
RUN apt -y upgrade

RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.10 curl git


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN pip install smithed==0.14.2

RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 18.17.1
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

ARG ARCH 64


COPY . .

RUN git clone https://github.com/Smithed-MC/UX -b master code
WORKDIR /code

RUN npm i -g turbo-linux-${ARCH} turbo
RUN npm i -g typescript


RUN npm i --platform=linux --arch=${ARCH} turbo@^1.10.12

COPY ./secret.json /code/platforms/api/

EXPOSE ${PORT}

ENV ADMIN_CERT=./secret.json
ENV DOCKER = true
ENV REDIS = true

CMD ["npm", "run", "api:dev"]