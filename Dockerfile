FROM node:14-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk add --no-cache --virtual .gyp \
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