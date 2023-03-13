FROM node:16-alpine as node
WORKDIR /usr/src/test-spa-app/ui
COPY ../packages/ui/*.json ./
RUN npm install -g @angular/cli
RUN npm install
COPY ../packages/ui/src ./src/

CMD npm run start -- --watch --port ${UI_PORT} --host ${UI_HOST} --poll 500






