#!/usr/bin/env bash

# source-oljuk a config file-t, így lokális változóként tudjuk kezelni az értékeket
source /app/docker.conf

# mindig itt van a projectünk
cd /app

# az app könyvtárunk mindig safe
git config --global --add safe.directory /app

# symfony CLI-t fog keresni, ez változott
mv /root/.symfony5 /root/.config/symfony-cli

# indítjuk a php szervert
symfony server:start -d --no-tls --allow-all-ip

# a saját konfigurációnk szerint itt érjük el a konténert
# shellcheck disable=SC2129
echo 'echo "--------------------------------------------------------------------"' >>/root/.bashrc
echo 'echo "KeyCraft (PHP 8.5) - http://'${name}'.docker:'${port}'"' >>/root/.bashrc
echo 'echo -e "--------------------------------------------------------------------\n"' >>/root/.bashrc
echo

# így lesz egy bash promptunk indítás után
echo 'export PS1="\[\e[31m\]['${name}']\[\e[m\] \[\e[32m\]\w\[\e[m\] \[\e[34m\]»\[\e[m\] "' >>/root/.bashrc
echo 'cd /app' >>/root/.bashrc

# timezone
echo "TZ='Europe/Budapest'; export TZ" >> /root/.bashrc

# hasznos alias-ok (core update, deploy staging & prod, stb).
echo "alias c='/app/bin/console'" >>/root/.bashrc
echo "alias cc='c c:c'" >>/root/.bashrc
echo "alias r='reset; source ~/.bashrc'" >>/root/.bashrc
echo "alias ls='ls -la --color=auto'" >>/root/.bashrc
echo "alias safegit='git config --global --add safe.directory /app'" >>/root/.bashrc

echo 'echo -e "Aliases:\n"' >>/root/.bashrc
echo "alias" >>/root/.bashrc

echo 'echo -e "\n"' >>/root/.bashrc

bash
