#!/usr/bin/env bash
set -e

echo "===== INICIO DESPLIEGUE AUTOMÁTICO ====="
date

cd "$(dirname "$0")/.."

echo
echo "===== ACTUALIZAR IMAGEN DESDE REGISTRO ====="
docker compose -f docker-compose.prod.yml pull || true

echo
echo "===== LEVANTAR APLICACIÓN ====="
docker compose -f docker-compose.prod.yml up -d

echo
echo "===== CONTENEDORES ACTIVOS ====="
docker ps --filter "name=practica7_app"

echo
echo "===== FIN DESPLIEGUE AUTOMÁTICO ====="
date
