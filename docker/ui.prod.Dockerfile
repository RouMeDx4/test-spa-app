FROM node:16-alpine as node
WORKDIR /usr/src/test-spa-app/ui
COPY ../packages/ui/*.json ./

RUN npm ci --production
COPY ../packages/ui/src ./src/

RUN npm run build --omit=dev
#stage 2
FROM nginx:alpine
WORKDIR /usr/src/test-spa-app/ui

COPY --from=node /usr/src/test-spa-app/ui/dist/ui /usr/share/nginx/html




