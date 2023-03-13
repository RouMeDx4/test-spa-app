FROM node:16-alpine
WORKDIR /usr/src/test-spa-app/server
COPY ../packages/server/*.json ./

RUN npm ci --production

COPY ../packages/server/src ./src/

# Install app dependencies


RUN npm run build

# Start the server using the production build
CMD [ "node", "dist/main.js" ]



