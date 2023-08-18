#!/bin/sh

sed '
	/^\s*$/{
		d
	}
	s/http:[^[:space:]]\+//g
	s/https:[^[:space:]]\+//g
	s/www:[^[:space:]]\+//g
	s/[^a-zA-Z ]//g
	s/[A-Z]/\L&/g
	
	s/\s\s*/ /g
	s/^\s//g
	s/\<[a-z]\>//g
	s/\<[a-z][a-z]\>//g
	' sample.txt > output.txt

while IFS= read -r p|| [[ -n "$p" ]]; do
	sed "s/\<$p\>//g" output.txt > output1.txt
	cat output1.txt > output.txt
	done < stopwords.txt

while IFS= read -r p|| [[ -n "$p" ]]; do
	sed "s/$p /#### /g" output.txt > output1.txt
	sed "s/$p$/#### /g" output1.txt > output.txt
	done < suffixes.txt

sed 's/####//g
	s/\s\s*/ /g
	s/^\s//g
	s/\s$//g
	/^\s*$/d
	s/\<[a-z]\>//g
	s/\<[a-z][a-z]\>//g
	' output.txt > output1.txt
cat output1.txt > output.txt

rm output1.txt


