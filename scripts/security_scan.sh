#!/usr/bin/env bash
set -e

echo "===== ANALISIS DE SEGURIDAD CON CLAMAV ====="
date

echo
echo "===== VERSION CLAMAV ====="
clamscan --version

echo
echo "===== ESCANEO DEL PROYECTO ====="
clamscan -r . \
  --infected \
  --exclude-dir="^./.git" \
  --exclude-dir="^./node_modules" \
  --exclude-dir="^./coverage" \
  --exclude-dir="^./reports" \
  --exclude-dir="^./dist"

echo
echo "Resultado: OK - no se han detectado amenazas"
