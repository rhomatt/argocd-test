#!/bin/sh

cd $(dirname $0)

rc-status | grep docker.*started || {
	sudo rc-service docker start
	echo waiting...
	sleep 5
}
docker rm -f registry
docker run -d -p 5000:5000 --name registry registry:2

cd ../images/
docker build -t localhost:5000/alpine .
docker push localhost:5000/alpine
