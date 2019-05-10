#!/usr/bin/env bash


sed -i '/de_DE.UTF-8/s/^#//' /etc/locale.gen
cat /etc/locale.gen | grep de_DE
docker ps
exec -it bix_postgresql_1 bash
