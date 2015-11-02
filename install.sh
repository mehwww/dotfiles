#!/bin/bash
! [ -d ~/.dotfile_backup ] && mkdir ~/.dotfile_backup
for i in .*; do
	if ! [ "$i" == "." ] && ! [ "$i" == ".." ] && ! [ "$i" == ".git" ]; then
		if [ -e ~/$i ]; then
			if ! ( cp -r ~/$i ~/.dotfile_backup/ ) || ! ( rm -rf ~/$i || unlink ~/$i ); then
				echo "Failed on $i" > /dev/stderr
			fi
		fi
		if ln -s $(pwd)/$i ~/$i; then
			echo "Linked: $i" > /dev/stderr
		else
			echo "Failed on $i" > /dev/stderr
		fi
	fi
done
