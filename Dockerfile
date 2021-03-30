FROM nginx:1.19.9-alpine

LABEL maintainer="whalehub (admin@datahoarder.dev)"

COPY src/regextester.conf /etc/nginx/conf.d
COPY src/regextester.php /usr/share/nginx/html
COPY src/start.sh /usr/sbin
COPY src/unitphp.config /srv

RUN apk add --no-cache \
      curl \
      php7 \
      unit \
      unit-php7 && \
      rm /etc/nginx/conf.d/default.conf && \
      chmod +x /usr/sbin/start.sh

EXPOSE 80

CMD ["sh", "/usr/sbin/start.sh"]
