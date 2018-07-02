FROM node:10-stretch
WORKDIR /home/node
USER node:node

COPY . /home/node
RUN npm install && npm test

CMD ["npm", "start"]
