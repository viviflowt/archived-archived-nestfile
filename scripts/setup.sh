#!/bin/bash

clear

clear

PACKAGE=rad
SCOPE=rad

LIB_PATH=lib

DESCRIPTION="Rad is a library for creating and managing web applications."
AUTHOR="Viviane Florido @vivianeflowt"
LICENSE=MIT
VERSION=0.0.1

# rm -rf api 2>/dev/null

# touch "$FOLDER/.gitkeep"

# npx nest new api --skip-install --skip-git --package-manager yarn --directory ./ 

yarn install


npm pkg set version="$VERSION"  
npm pkg set description="$DESCRIPTION" 
npm pkg set author="$USER"
npm pkg set license="$LICENSE" 



npm set-script "check:dep" "npx depcheck"
npm set-script "check:npm" "npx npm-check -u"
npm set-script "check:format" "prettier --check **/*.ts"

npm set-script "build:docs" "npx @compodoc/compodoc -p tsconfig.doc.json --name sdz-rule-engine --language=pt-BR --theme=Postmark --output=doc --disableCoverage"

npm set-script "dev" "nest start --watch"

npm set-script "format" "prettier --write **/*.ts"
npm set-script "lint" "eslint \"{src,apps,libs,test}/**/*.ts\" --fix"

npm set-script "test" "node --expose-gc ./node_modules/.bin/jest --runInBand --logHeapUsage"
npm set-script "test:ci" "jest --coverage --forceExit --runInBand --no-cache"
npm set-script "test:clear" "jest --clearCache"
npm set-script "test:cov" "jest --coverage --no-cache"
npm set-script "test:debug" "node --inspect-brk -r tsconfig-paths/register -r ts-node/register node_modules/.bin/jest --runInBand"
npm set-script "test:watch" "jest --watch"

yarn add -D @compodoc/compodoc 
yarn add -D @faker-js/faker

yarn add -D jest jest-extended jest-ts-auto-mock ts-auto-mock weak-napi expect-type ttypescript
yarn add -D nodemon ts-node ts-node-dev
yarn add -D syncpack
yarn add -D typescript tslib type-fest typesync

yarn add @golevelup/nestjs-common @golevelup/nestjs-discovery

yarn add @nestjs/common @nestjs/core @nestjs/config
yarn add @nestjs/event-emitter eventemitter2
yarn add @nestjs/microservices

yarn add @nestjs/throttler @nestjs/terminus  @nestjs/serve-static 

yarn add @nestjs/axios axios

yarn add @nestjs/platform-express express compression helmet @nestjs/swagger && yarn add -D @types/multer

yarn add @nestjs/websockets @nestjs/platform-socket.io

yarn add bluebird
yarn add jsonwebtoken

yarn add class-transformer class-validator zod
yarn add fs-extra fast-glob
yarn add lodash
yarn add mongodb mongoose @typegoose/typegoose
yarn add ioredis && yarn add -D ioredis-mock

yarn add commander inquirer@8.2.4 chalk@4.1.2 nest-commander

yarn add mysql2
yarn add node-cache cache-manager && yarn add -D -D @types/cache-manager

yarn add pg 
yarn add sqlite3

npx typesync

yarn add -D @types/node @types/jest 

rm -rf node_modules 2>/dev/null

yarn install 

yarn audit

npx syncpack format