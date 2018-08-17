#!/bin/bash
if [ "$1" == "" ];then
	echo "Parsing de Sites"
	echo "Exemplo de comando: $0 <url.do.site.alvo>"
else
	wget -q $1 
	grep href index.html | awk -F"/" {'print $3'} | awk -F" " {'print $1'} | grep -v ">" | sed 's/\"//' | sort -u | uniq -u > /tmp/list.txt

	for h in $(cat /tmp/list.txt); do
		host $h | grep -v "not found:"
	done

rm -rf index.html


fi
