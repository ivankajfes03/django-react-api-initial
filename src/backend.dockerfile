FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1
# # Copy config file
# COPY ./deploy/docker/backend/default /etc/nginx/sites-enabled/default
RUN mkdir /opt/src
WORKDIR /opt/src
ADD . /opt/src
RUN pip install -r requirements.txt
# # # Copy phalcon-devtools
# # COPY ./phalcon-devtools /opt/src
RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev \
    && pip install -r requirements.txt


EXPOSE 5000
