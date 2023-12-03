#!/bin/sh

cd $(dirname $0)

docker run -d -p 5000:5000 --name registry registry:2 || echo registry already running

cd ../images/
docker build -t localhost:5000/alpine .
docker push localhost:5000/alpine