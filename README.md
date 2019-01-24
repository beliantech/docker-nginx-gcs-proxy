# docker-nginx-gcs-proxy
A Docker image for running Nginx as a caching proxy for Google Cloud Storage.

This is the Git repo for the Docker image built automatically at Docker Hub -
[socialwifi/nginx-gcs-proxy](https://hub.docker.com/r/socialwifi/nginx-gcs-proxy/).

## Usage

```bash
docker run -d -e GCS_BUCKET="[bucket/folder]" -p 8080:8080 socialwifi/nginx-gcs-proxy

```

## Configuration

The following tables lists the configurable environment variables of nginx-gcs-proxy and their default values.

Variable | Description | Default
--- | --- | ---
`GCS_BUCKET` | Full URL to the bucket folder. `https://storage.googleapis.com/[GCS_BUCKET]/index.html` | None - required!
`LISTEN_PORT` | Server listen port | 8080
`REDIRECT_404_TO_INDEX` | When requested path is not found in the bucket, return index.html. Useful when serving single page apps, like Angular, React, Ember. Possible values: "true", "false". | "false"
`PROXY_CACHE` | If true, enables NGINX proxy caching. | "false"
`PROXY_CACHE_DURATION` | Configures the NGINX proxy cache duration. | "30m"
`PUBLIC_CACHE_DURATION` | If present, configures the Cache-Control headers to this duration. Set to blank ("") to disable. | "1h"

## Health-checking

```bash
curl -v http://127.0.0.1:8080/healthz/

```
```
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to 127.0.0.1 (127.0.0.1) port 8080 (#0)
> GET /healthz/ HTTP/1.1
> Host: 127.0.0.1:8080
> User-Agent: curl/7.55.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: nginx
< Date: Wed, 17 Jan 2018 14:22:23 GMT
< Content-Type: application/octet-stream
< Content-Length: 0
< Connection: keep-alive
<
* Connection #0 to host 127.0.0.1 left intact
```

## Building

```bash
docker build nginx-gcs-proxy -t socialwifi/nginx-gcs-proxy

```

## Testing

```bash
docker run --rm -e GCS_BUCKET="dummy" socialwifi/nginx-gcs-proxy nginx -t
```
