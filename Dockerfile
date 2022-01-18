FROM python:3.10.1-alpine3.15
LABEL maintainer="bryanttv"

ENV PYTHONUNBUFFERED 1

COPY Pipfile Pipfile.lock ./
RUN pip install pipenv
RUN pipenv install --system --deploy

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user