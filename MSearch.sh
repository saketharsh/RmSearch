#! /bin/bash


########################################################
# Bash script to match MP3 song name across computer   # 
# and play it with suitable player                     #
# Copyright- Saket Harsh   (IIT Kanpur)                # 
# E-Mail- sharsh2010@gmail.com                         #
########################################################


cd ~


name="$1"
count=0
while [ $count -eq 0 ]
do
	count=$( ls -R  | egrep   ".mp3$" | grep -i -c "$name")
	while [ $count -eq 0 ]
	do
		echo "No such .mp3 Song found. Try with another name:- \n "
		read name
		count=$(  ls -R  | egrep ".mp3$" | grep -i -c "$name")
	done

	while [ $count -gt 1 ]
	do
		a=$(  ls -R | egrep  ".mp3$" | grep -i "$name" )
		echo "Multiple File names found. Select any one from the listed below:-"
		echo "$a"
		echo " Be more specific :-"
		read name
		count=$(  ls -R  | egrep ".mp3$" | grep -i -c "$name" )
	done
		a=$( ls -R | egrep ".mp3$" | grep -i  "$name" )
		cd ~/RmSearch/

done


cd ~/RmSearch/
./EXT-manager.py "$a"


if [ "$(cat songlist2.txt)" ]
	then
	fullpath=$(cat songlist2.txt)
	rm -rf songlist.txt
	rm -rf songlist2.txt
	cd ~
	vlc "$fullpath"
else
	echo "The file either does not exist or  is not and mp3 file.... Exiting!!"
fi








