#!/bin/bash

rm -rf node_modules 2>/dev/null
rm -rf coverage 2>/dev/null
rm -rf dist 2>/dev/null
rm -rf package-lock.json 2>/dev/null

npm install

npm install --save-dev @faker-js/faker type-fest ts-auto-mock tslib 

npm install --save fs-extra fast-glob eventemitter2 fast-glob commander inquirer@8.2.4 cosmiconfig conf chalk@4.1.2

npm install --save lodash node-cache

npm install --save-dev @faker-js/faker @types/jest expect-type jest ts-jest jest-extended weak-napi ttypescript type-fest jest-ts-auto-mock  typesync

npm install --save-dev commitizen cz-conventional-changelog auto-changelog release-it 

npm install --save-dev @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-prettier eslint-plugin-prettier prettier

npm install --save-dev @types/node @types/jest 

typesync

rm -rf node_modules 2>/dev/null

npm install

npm audit fix