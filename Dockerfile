FROM node:14-alpine

ADD ./apt-sources.list /etc/apt/sources.list
RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++ \
    && apk del .gyp

WORKDIR /usr/src/app

COPY package*.json .npmrc ./

# RUN npm install
RUN npm ci --only=production

COPY . .

EXPOSE 3000

CMD ["npm", "start"]