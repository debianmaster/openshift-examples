FROM node:8.12.0-alpine

EXPOSE 8080

WORKDIR /app

ADD package.json /app/package.json
RUN npm install
ADD . /app
CMD ["npm","start"]
