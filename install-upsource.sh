#!/bin/bash
DIST=$1
VERSION=$2
ARCH_NAME=upsource-$VERSION.zip
wget http://download.jetbrains.com/upsource/$ARCH_NAME
unzip $ARCH_NAME 
mv Upsource $DIST
rm $ARCH_NAME