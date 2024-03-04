FROM alpine:3.19

ENV UMASK=0777 UMASK_DIR=0777

RUN apk update && apk upgrade
RUN mkdir -p /etc/nginx/ssl

RUN apk add nginx openssl

RUN openssl req -x509 -noenc -out /etc/nginx/ssl/inception.crt \
		-subj "/C=NL/CN=$DOMAIN_NAME/OU=codam" \
		-newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key 

EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]