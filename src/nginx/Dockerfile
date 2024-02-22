FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN apt update
RUN apt install nginx

EXPOSE 8080 1443
#CMD ["nginx", "-g", "daemon off;"]