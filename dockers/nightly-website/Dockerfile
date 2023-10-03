FROM node:18.17.1-alpine

RUN apk update
RUN apk add git

COPY . .

RUN git clone https://github.com/Smithed-MC/UX -b master code
WORKDIR /code

RUN npm i

WORKDIR /code/platforms/website

ENV PORT 8002
EXPOSE ${PORT}

CMD ["npm", "run", "serve"]