FROM alpine:3.15 AS base

ENV NODE_ENV=production \
  APP_PATH=/app

WORKDIR $APP_PATH

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache --update nodejs=16.20.1-r0 npm=8.1.3-r0

FROM base AS install

COPY package.json package-lock.json ./

RUN  npm i --registry=https://registry.npmmirror.com/
RUN  npm run build

COPY ./dist /app/dist


FROM nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf




