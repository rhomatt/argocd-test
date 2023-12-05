#!/bin/sh

cd $(dirname $0)

docker rmi -f registry:2
docker run -d -p 5000:5000 --name registry registry:2

cd ../images/
docker build -t localhost:5000/alpine .
docker push localhost:5000/alpine
