FROM node:14-alpine

WORKDIR /usr/src/app

COPY package*.json .npmrc ./

# RUN npm install
RUN npm ci --only=production

COPY . .


EXPOSE 3000

CMD ["npm", "start"]