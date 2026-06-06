#!/bin/bash

echo "Hostname"
hostname
echo "Username"
whoami
echo "Di chuyen vao thu muc du an"
cd huan-compose-app/fastshop
echo "Build he thong"
docker compose build --no-cache fastshop-app
echo "Chay lai app"
docker compose up -d --no-deps --remove-orphans fastshop-app
echo "Trang thai container"
docker compose ps
echo "Log app"
docker compose logs --tail=40 fastshop-app
