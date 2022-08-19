#!/bin/bash

clear

rm -rf node_modules 2>/dev/null
rm -rf coverage 2>/dev/null
rm -rf dist 2>/dev/null

npm install 
npm audit

npm run format
npm run lint

npm run build
npm run test

npx syncpack format




rm -rf node_modules 2>/dev/null
rm -rf coverage 2>/dev/null
rm -rf dist 2>/dev/null

npm install --production


npm run build


npm run compile
