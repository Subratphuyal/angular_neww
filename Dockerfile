FROM node:14.15.0

USER root
WORKDIR /usr/app/my-angular-app

COPY . .
