FROM alpine:3.15 AS base
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache --update nodejs=16.20.1-r0 npm=8.1.3-r0
COPY . .
WORKDIR /app
RUN  npm i --registry=https://registry.npmmirror.com/
RUN  npm run build-only



FROM nginx as prod-stage
COPY --from=base ./dist  /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf






