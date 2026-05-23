#!/usr/bin/env bash
set -e

PROJECT_NAME="practica7-cicd-solerdiaz"

echo "===== INICIO DESPLIEGUE AUTOMÁTICO ====="
date

cd "$(dirname "$0")/.."

echo
echo "===== PROYECTO DOCKER COMPOSE ====="
echo "$PROJECT_NAME"

echo
echo "===== ACTUALIZAR IMAGEN DESDE REGISTRO ====="
docker compose -p "$PROJECT_NAME" -f docker-compose.prod.yml pull

echo
echo "===== LEVANTAR APLICACIÓN ====="
docker compose -p "$PROJECT_NAME" -f docker-compose.prod.yml up -d --force-recreate

echo
echo "===== CONTENEDORES ACTIVOS ====="
docker ps --filter "name=practica7_app"

echo
echo "===== IMAGEN USADA ====="
docker inspect practica7_app --format='{{.Config.Image}}'

echo
echo "===== FIN DESPLIEGUE AUTOMÁTICO ====="
date
