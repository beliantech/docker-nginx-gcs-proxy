# gcs-spa-proxy
A Docker image for running Nginx as a proxy for Google Cloud Storage, with caching and SPA features.

## Usage

No public image available at the moment. Fork away!

## Configuration

The following tables lists the configurable environment variables of nginx-gcs-proxy and their default values.

Variable | Description | Default
--- | --- | ---
`GCS_BUCKET` | Full URL to the bucket folder. `https://storage.googleapis.com/[GCS_BUCKET]/index.html` | None - required!
`LISTEN_PORT` | Server listen port | 8080
`REDIRECT_404_TO_INDEX` | When requested path is not found in the bucket, return index.html. Useful when serving single page apps, like Angular, React, Ember. Possible values: "true", "false". | "false"
`PROXY_CACHE` | If true, enables NGINX proxy caching. | "false"
`PROXY_CACHE_DURATION` | Configures the NGINX proxy cache duration. | "30m"
`CACHE_CONTROL` | Configures Cache-Control caching (e.g. Cache-Control: private, max-age=PUBLIC_CACHE_DURATION). Set to "none" to disable. | "private"
`CACHE_CONTROL_DURATION` | If present, configures the Cache-Control headers to this duration. | "1h"

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
docker build gcs-spa-proxy

```

## Testing

```bash
docker run --rm -e GCS_BUCKET="dummy" gcs-spa-proxy nginx -t
```
