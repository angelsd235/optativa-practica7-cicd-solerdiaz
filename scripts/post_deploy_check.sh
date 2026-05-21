#!/usr/bin/env bash
set -e

URL="${1:-http://localhost:8080/health}"

echo "===== PRUEBA POST-DESPLIEGUE ====="
date

echo
echo "Comprobando URL: $URL"

HTTP_CODE=$(curl -s -o /tmp/practica7_health_response.txt -w "%{http_code}" "$URL")

echo
echo "Código HTTP recibido: $HTTP_CODE"

echo
echo "Respuesta:"
cat /tmp/practica7_health_response.txt
echo

if [ "$HTTP_CODE" = "200" ]; then
  echo "Resultado: OK - aplicación desplegada correctamente"
  exit 0
else
  echo "Resultado: ERROR - la aplicación no responde correctamente"
  exit 1
fi
