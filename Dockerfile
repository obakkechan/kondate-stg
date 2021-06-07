FROM ubuntu:18.04
RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://jp.archive.ubuntu.com/ubuntu/%g" /etc/apt/sources.list
RUN apt update && apt upgrade -y && apt install python3 python3-pip python3-dev libmysqlclient-dev -y
RUN pip3 install mysqlclient==1.4.2.post1 flask==0.12.1 gunicorn==19.9.0 python-dotenv

# FROM obakkechan/kondate_app:v3.0
COPY . /app
WORKDIR /app
CMD while true; do gunicorn --bind 0.0.0.0:80 app_server:app ; done

# FROM python:slim-buster
# RUN apt update && apt upgrade -y && apt install python3-pip default-libmysqlclient-dev -y
# RUN pip install mysqlclient flask gunicorn python-dotenv
# COPY . /app
# WORKDIR /app
# CMD while true; do gunicorn --bind 0.0.0.0:80 app_server:app ; done
