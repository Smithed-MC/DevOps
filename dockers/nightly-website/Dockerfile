FROM node:18.17.1-alpine

RUN apk update
RUN apk add git

COPY . .

RUN git clone https://github.com/Smithed-MC/UX -b main code
WORKDIR /code

RUN npm i

RUN npx turbo run build --filter=website

EXPOSE ${PORT}

CMD ["npm", "run", "web:serve"]