FROM alpine:3.10

# Update packages to latest versions
RUN apk update && apk upgrade

# Install nginx
RUN apk add --no-cache nginx

# Disable daemon mode so nginx will run in foreground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Copy config file
COPY ./development.conf /etc/nginx/conf.d/default.conf

RUN mkdir /run/nginx

# Run nginx
EXPOSE 8000

WORKDIR /etc/nginx

CMD ["nginx"]
