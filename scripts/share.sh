#!/bin/bash

clear

NAME=@viviflowt/makefile

npm remove -g --force "$NAME" 
npm list -g --depth 0 | grep "$NAME" 

npm link

npm install -g . --force

npm list -g --depth 0 | grep "$NAME"




