#!/bin/sh
docker run -d --name parkomat -e PARKOMAT_CONFIG_FILE=/opt/parkomat/config.toml -v /home/evoup/projects/gitProjects/dockerfiles/parkomat:/opt/parkomat -v logs:/var/log/parkomat -P parkomat/parkomat
