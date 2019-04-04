FROM python:3.6

ENV PYTHONUNBUFFERED 1

COPY . /first_project/
WORKDIR /first_project

# Install python mysql client
RUN apt-get update \
    && apt-get -y install libmysqlclient-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

ADD requirements.txt /first_project/
RUN pip install -r requirements.txt
#RUN pip install pipenv
#RUN pipenv install

