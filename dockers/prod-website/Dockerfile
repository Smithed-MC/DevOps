FROM node:18.17.1-alpine

RUN apk update
RUN apk add git

COPY . .

RUN git clone https://github.com/Smithed-MC/UX -b production code
WORKDIR /code

RUN npm i

WORKDIR /code

EXPOSE ${PORT}

CMD ["npm", "run", "web:serve"]