FROM node:16.14.0
CMD npm i --resigtry=https://registry.npmmirror.com && npm run build-only

FROM nginx:1.12
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./dist /app/dist

#FROM node:10.15.1
#RUN echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib \n \
#    deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib \n \
#    deb http://mirrors.aliyun.com/debian-security stretch/updates main \n \
#    deb-src http://mirrors.aliyun.com/debian-security stretch/updates main \n \
#    deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib \n \
#    deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib \n \
#    deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib \n \
#    deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" > /etc/apt/sources.list
#RUN apt update
#RUN apt install -y nginx
#COPY . /workdir
#RUN cd workdir && npm install cnpm -g --registry=https://registry.npm.taobao.org && cnpm install
#RUN cd workdir && npm run build
#RUN mkdir -p /app/dist
#RUN cd workdir && cp -r .  /app/dist
#COPY nginx.conf /etc/nginx/nginx.conf
#RUN rm -rf /workdir
#EXPOSE 80
#CMD  nginx



