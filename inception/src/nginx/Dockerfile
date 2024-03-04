FROM alpine:3.19

RUN apk update && apk upgrade
RUN mkdir -p /etc/nginx/ssl

RUN apk add nginx openssl

RUN openssl req -x509 -noenc -out /etc/nginx/ssl/inception.crt\
		-subj "/C=NL/CN=ageels.42.fr/OU=codam/emailAddress=ageels@student.codam.nl"\
		-newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key 

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]