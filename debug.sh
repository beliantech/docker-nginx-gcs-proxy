#!/bin/bash
docker build . -t gcs-spa-proxy
docker run -e REDIRECT_404_TO_INDEX=true -e GCS_BUCKET=kanrails-staging-app-static -e PROXY_CACHE=true -e CACHE_CONTROL=public -p 80:8080 gcs-spa-proxy