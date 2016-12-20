#! /bin/bash


########################################################
# Bash script to match MP3 song name across computer   # 
# and play it with suitable player                     #
# Copyright- Saket Harsh   (IIT Kanpur)                # 
# E-Mail- sharsh2010@gmail.com                         #
########################################################

cd ~

echo "Enter the name of Song  you wanna play:-  "

read name
count=0
while [ $count -eq 0 ]
do
	count=$( ls -R  | grep -c -i "$name")
	while [ $count -eq 0 ]
	do
		echo "No such Song found. Try with another name:- \n "
		read name
		count=$(  ls -R  | grep -c -i "$name")
	done

	while [ $count -gt 1 ]
	do
		a=$(  ls -R |grep -i  "$name" )
		echo "Multiple File names found. Select any one from the listed below:-"
		echo "$a"
		echo " Be more specific :-"
		read name
		count=$(  ls -R  | grep -c -i "$name")
	done
		a=$( ls -R |grep -i  "$name" )
		cd ~/RmSearch/
		echo "$a" > songlist.txt

done


cd ~/RmSearch/
./EXT-manager.py


echo ""
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








