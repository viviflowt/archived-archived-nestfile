#!/bin/bash

clear

PACKAGE=$1
# PACKAGE=b

FOLDER=packages
SCOPE=guru
AUTHOR="Viviane Florido @vivianeflowt"
LICENSE=MIT
VERSION=0.0.1

rm -rf $FOLDER/$PACKAGE 2>/dev/null

touch "$FOLDER/.gitkeep"

printf "\nCreating $PACKAGE package...\n"
sleep 1

npm init -yes --scope=$SCOPE --name=$PACKAGE --license=MIT -w "$FOLDER/$PACKAGE"

npm set-script -w "$FOLDER/$PACKAGE" "compile" "rm -rf dist/* && tsc -p tsconfig.build.json && rimraf tsconfig.build.tsbuildinfo"  
npm set-script -w "$FOLDER/$PACKAGE" "build" "tsc -p ./tsconfig.build.json"  
npm set-script -w "$FOLDER/$PACKAGE" "build:watch" "tsc -p ./tsconfig.json --watch"
npm set-script -w "$FOLDER/$PACKAGE" "prebuild" "rimraf dist"
npm set-script -w "$FOLDER/$PACKAGE" "clean" "rimraf dist"
npm set-script -w "$FOLDER/$PACKAGE" "dev" "nodemon --watch --quiet './src/' --exec 'ts-node ./src/main.ts' -e ts"
npm set-script -w "$FOLDER/$PACKAGE" "start" "node ./dist/main.js"

npm -w "$FOLDER/$PACKAGE" pkg set main="dist/index.js" 
npm -w "$FOLDER/$PACKAGE" pkg set types="dist/index.d.ts" 
npm -w "$FOLDER/$PACKAGE" pkg set version="$VERSION"  
npm -w "$FOLDER/$PACKAGE" pkg set description="$PACKAGE" 
npm -w "$FOLDER/$PACKAGE" pkg set private=false 
npm -w "$FOLDER/$PACKAGE" pkg set author="$USER"
npm -w "$FOLDER/$PACKAGE" pkg set license="$LICENSE" 

echo '
!dist/*
!package.json
!readme.md
'>>"$FOLDER/$PACKAGE/.npmignore"

echo '{
	"restartable": "rs",
	"ignore": [
    "node_modules",
		"**/.git"
	],
	"verbose": false,
	"execMap": {
		"ts": "node -r ts-node/register/transpile-only"
	},
	"env": {
		"TS_NODE_FILES": "true"
	},
	"ext": "ts"
}
'>>$FOLDER/$PACKAGE/nodemon.json 

mkdir -p $FOLDER/$PACKAGE/src 

echo "import 'reflect-metadata';

export class Config {
    static create() {
      return new Config();
    }

    constructor() {
      console.log('created');
    }

    hello(){
      console.log('Hello World');
    }

    log(message?: string){
      console.log(message || 'no message');
    }
}
">>$FOLDER/$PACKAGE/src/main.ts

echo "
 export * from './main';
">>$FOLDER/$PACKAGE/src/index.ts

echo "node_modules
dist
coverage
*.log
*.tmp
">>$FOLDER/$PACKAGE/.gitignore 

echo '{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "rootDir": "src",
    "outDir": "dist"
  } 
}
'>>$FOLDER/$PACKAGE/tsconfig.json

echo '{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "rootDir": "src",
    "outDir": "dist"
  },
  "exclude": [
    "**/*.test.ts",
    "**/*.spec.ts",
    "dist",
    "node_modules"
  ],
}
'>>$FOLDER/$PACKAGE/tsconfig.build.json 

npm install -D -w "$FOLDER/$PACKAGE" typescript ts-node nodemon rimraf @types/node @types/jest prettier
npm install -w "$FOLDER/$PACKAGE" reflect-metadata lodash dotenv chalk@4.1.2

npx syncpack format

npm run --workspace="$FOLDER/$PACKAGE" --if-present format

npx update-ts-references --verbose

echo "Done!"


# npx update-ts-references --help


# npm i @proto/b -w ./packages/a