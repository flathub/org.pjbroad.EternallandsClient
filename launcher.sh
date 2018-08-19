#! /bin/sh

datadir=/app/data
userdir=~/.elc
serverfile=servers.lst
inifile=el.ini
exename=/app/bin/el.linux.bin
browser=xdg-open

mkdir -p $userdir || exit

if [ ! -r $userdir/$serverfile ]
then
	cp -p $datadir/$serverfile $userdir/ || exit
fi

if [ -z "$1" ]
then
	config="main"
else
	config="$1"
fi

mkdir -p $userdir/$config || exit

if [ ! -r $userdir/$config/$inifile ]
then
	cp -p $datadir/$inifile $userdir/$config/ || exit
fi

exec "$exename" -dir="$datadir" -b="$browser" "$config"
