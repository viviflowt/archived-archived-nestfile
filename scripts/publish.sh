#!/bin/bash

clear

rm -rf node_modules 2>/dev/null
rm -rf coverage 2>/dev/null
rm -rf dist 2>/dev/null

npm install 
npm run test

npm run format
npm run build
npm run check

npm audit

