FROM nginx:1.15.8
RUN apt-get update \
    && apt-get install -y \
        wget \
    && rm -r /var/lib/apt/lists/*
ENV DOCKERIZE_VERSION v0.6.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
COPY nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl

ENV GCS_BUCKET " "
ENV LISTEN_PORT "8080"

ENV REDIRECT_404_TO_INDEX "false"
ENV PROXY_CACHE "false"
ENV PROXY_CACHE_DURATION "30m"

ENV EXPIRES_DURATION "1h"

ENTRYPOINT ["dockerize", \
            "-template", \
            "/etc/nginx/nginx.conf.tmpl:/etc/nginx/nginx.conf"]
CMD ["nginx", \
    "-g", \
    "daemon off;"]
