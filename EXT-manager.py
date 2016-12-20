#! /usr/bin/env python
 
import os
source=open("songlist.txt",'r')
target=open("songlist2.txt",'w')
indata=source.readlines()
print indata


for val in indata:
	val=val.rstrip()
	# It removes /n from the Song Name for Pattern Matching
	for p in  os.environ["HOME"].split(";"):
		for r,d,f in os.walk(p):
			for files in f:
				if files ==val:
					if os.path.splitext(files)[1]==".mp3":
						target.write(os.path.join(r,files)) 
						target.write("\n")
						
					


