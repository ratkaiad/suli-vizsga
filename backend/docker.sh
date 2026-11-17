#!/usr/bin/env bash

# source-oljuk a config file-t, így lokális változóként tudjuk kezelni az értékeket
if [ ! -f docker.conf ]; then
  echo "Missing docker.conf"
  exit
fi

source docker.conf

echo Building ${name}:${port}...

# mindig ugyanazon a néven hozzuk létre a containert, ezért előtte töröljük
docker stop ${name} 2>/dev/null || true && docker rm ${name} 2>/dev/null || true

# sima buildet csinálunk
docker build . -t ${name}

# indítjuk a konténerünket
docker run ${custom_run_options} --rm -it \
  -v "$(pwd)":/app/ \
  -v ${uploads}:/opt/fs \
  -p ${port}:8000 \
  --add-host=host.docker.internal:host-gateway \
  --name ${name} \
  ${name}
