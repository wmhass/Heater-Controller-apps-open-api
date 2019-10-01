# pull official base image
FROM python:3.7.4-alpine

# set work directory
WORKDIR /usr/src/services/heater_control_app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && pip install psycopg2 \
    && apk del build-deps

# install dependencies
RUN pip install --upgrade pip
RUN pip install pipenv
COPY ./Pipfile /usr/src/services/heater_control_app/Pipfile
RUN pipenv install --skip-lock --system --dev

# copy entrypoint.sh
COPY ./entrypoint.sh /usr/src/services/heater_control_app/entrypoint.sh

# copy project
COPY . /usr/src/services/heater_control_app/

# run entrypoint.sh
ENTRYPOINT ["/usr/src/services/heater_control_app/entrypoint.sh"]