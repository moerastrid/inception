FROM debian:11

RUN apt-get update && apt-get upgrade
RUN apt-get install systemctl -y
RUN apt-get install mariadb-server -y

COPY ./script.sh script.sh

EXPOSE 3306

CMD ["./script.sh"]