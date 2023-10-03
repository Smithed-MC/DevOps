FROM node:18.17.1-alpine

RUN apk update
RUN apk add git

ENV BRANCH=redesign-landing

COPY . .

RUN git clone https://github.com/Smithed-MC/UX -b ${BRANCH} code
WORKDIR /code

RUN npm i

WORKDIR /code/platforms/website

EXPOSE ${PORT}

CMD ["npm", "run", "serve"]