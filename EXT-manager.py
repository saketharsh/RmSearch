#! /usr/bin/env python
 
import os 
import sys
garb, val = sys.argv
target=open("songlist2.txt",'w')

val=val.rstrip()
	# It removes /n from the Song Name for Pattern Matching
for p in  os.environ["HOME"].split(";"):
	for r,d,f in os.walk(p):
		for files in f:
			if files ==val:
				target.write(os.path.join(r,files)) 			
				target.write("\n")

						
					


