# Práctica 7 - CI/CD con GitHub Actions y Docker

Este repositorio contiene una práctica sencilla de integración y despliegue continuo. La aplicación es pequeña porque el objetivo principal no es desarrollar un software complejo, sino demostrar el funcionamiento de un pipeline CI/CD completo.

La práctica utiliza GitHub Actions para automatizar las fases de análisis, pruebas, construcción, publicación de imágenes Docker, despliegue en un servidor Ubuntu y notificación por correo.

## Tecnologías utilizadas

- Node.js
- Mocha
- ESLint
- c8
- Docker
- Docker Compose
- GitHub Actions
- Docker Hub
- ClamAV
- Runner self-hosted
- Gmail SMTP

## Estructura del proyecto

- `src/app.js`: contiene las funciones principales de la aplicación.
- `src/server.js`: levanta el servidor HTTP.
- `tests/app.test.js`: contiene las pruebas unitarias.
- `Dockerfile_debian`: construye la imagen basada en Debian.
- `Dockerfile_alpine`: construye la imagen basada en Alpine.
- `docker-compose.prod.yml`: define el despliegue de producción.
- `scripts/deploy.sh`: automatiza el despliegue.
- `scripts/post_deploy_check.sh`: comprueba que la aplicación responde después del despliegue.
- `scripts/security_scan.sh`: ejecuta el análisis de seguridad con ClamAV.
- `.github/workflows/pipeline.yml`: define el pipeline de GitHub Actions.

## Aplicación

La aplicación levanta un servidor HTTP en Node.js.

El endpoint principal de comprobación es:

`/health`

Cuando todo funciona correctamente, responde con un JSON como este:

`{"app":"Practica 7 CI/CD","author":"solerdiaz","status":"ok"}`

## Comandos locales

Instalar dependencias:

`npm ci`

Ejecutar análisis de código:

`npm run lint`

Ejecutar pruebas:

`npm test`

Ejecutar cobertura:

`npm run coverage`

Generar build:

`npm run build`

## Docker

La práctica genera dos imágenes Docker diferentes con el mismo software:

- `angelsddev/practica7-cicd:debian`
- `angelsddev/practica7-cicd:alpine`

La imagen usada para el despliegue final es la basada en Debian.

## Despliegue

El despliegue se realiza con Docker Compose mediante el archivo:

`docker-compose.prod.yml`

El contenedor principal se llama:

`practica7_app`

La aplicación queda publicada en el puerto 8080 de la máquina:

`http://localhost:8080/health`

## Pipeline CI/CD

El pipeline está definido en:

`.github/workflows/pipeline.yml`

Se ejecuta con varios disparadores:

- push a `main` o `develop`
- pull request hacia `main`
- ejecución manual
- ejecución programada con cron

Las fases principales del pipeline son:

1. Análisis de calidad y pruebas.
2. Análisis de seguridad con ClamAV.
3. Construcción del artefacto.
4. Construcción y publicación de imágenes Docker en Docker Hub.
5. Despliegue continuo en la máquina `optativa`.
6. Notificación por correo electrónico.

## Runner self-hosted

El despliegue se realiza en una máquina Ubuntu Server llamada `optativa`.

Para ello se usa un runner self-hosted de GitHub Actions con etiquetas como:

- `self-hosted`
- `Linux`
- `X64`
- `optativa`
- `docker`
- `deploy`

Este runner ejecuta el job de despliegue y actualiza el contenedor de producción.

## Seguridad

Como parte adicional de la práctica se usa ClamAV para realizar un análisis básico de seguridad del proyecto.

El script usado es:

`scripts/security_scan.sh`

## Notificaciones

Al finalizar el pipeline se envía una notificación por correo electrónico.

Si todo va bien, el correo indica que el pipeline ha terminado correctamente.  
Si algo falla, el correo muestra que hubo error y lista los jobs afectados.

Las credenciales se guardan como secretos de GitHub Actions, no dentro del código.

## Comprobación final

Para comprobar que la aplicación está desplegada correctamente:

`curl -i http://localhost:8080/health`

Si todo funciona bien, debe devolver un estado HTTP 200 y el JSON de estado de la aplicación.


