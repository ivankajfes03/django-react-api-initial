FROM alpine:3.10

# Update packages to latest versions
RUN apk update && apk upgrade

# Install runtime dependencies
RUN apk add --no-cache --virtual .runtime-deps \
      npm \
      nodejs

RUN mkdir -p /opt/web

WORKDIR /opt/web

COPY ./ .

COPY ./start-web.sh /opt/
RUN chmod +x /opt/start-web.sh

EXPOSE 3000

CMD /opt/start-web.sh
