#!/bin/bash

if [ $# -eq 0 ]; then
		echo "No arguments provided"
		exit 1
fi

for dir in $@; do
		if [ ! -d $dir ]; then
				echo "Directory $dir does not exist"
				exit 1
		fi

		cd $dir
		sh init.sh
		cd ..
done
