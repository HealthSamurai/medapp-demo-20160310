#!/bin/bash
docker stop medapp-demo-20160310
docker rm medapp-demo-20160310
docker build --tag medapp-demo-20160310 .
docker create --tty --publish=7022:22 --name medapp-demo-20160310 medapp-demo-20160310
docker start medapp-demo-20160310
