#!/bin/bash

clear

rm -rf node_modules 2>/dev/null
rm -rf coverage 2>/dev/null
rm -rf dist 2>/dev/null
rm -rf package-lock.json 2>/dev/null
rm -rf yarn.lock 2>/dev/null
rm -rf pnpm-lock.yaml 2>/dev/null
rm -rf tsconfig.build.tsbuildinfo 2>/dev/null
rm -rf tsconfig.tsbuildinfo 2>/dev/null
rm -rf *.log 2>/dev/null
rm -rf .tmp 2>/dev/null
rm -rf .cache 2>/dev/null
rm -rf doc 2>/dev/null
rm -rf *.tgz 2>/dev/null

# pnpm install 

# pnpm update
# npm install
# npm install -ws

yarn
npx typesync

syncpack fix-mismatches 
syncpack format