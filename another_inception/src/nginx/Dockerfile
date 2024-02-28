FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]