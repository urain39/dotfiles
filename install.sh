#!/usr/bin/env sh

HERE=$PWD

for CONF in `ls ./`; do
	test -f $CONF && {
		ln -sf $HERE/$CONF ~/.$CONF
	}
done

for DIR in `ls ./`; do
	test -d $DIR && {
		cd $HERE/$DIR && sh install.sh
	}
done

