#/bin/sh
docker run -d --name mitmdump -P -v $(pwd):/opt evoup/mitmdump
