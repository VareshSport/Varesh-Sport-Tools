#!/bin/sh

cd $1
rm sq*.j*
convert -define jpeg:size=1080x1080 *.j* -thumbnail 1080x1080^ -gravity center -extent 1080x1080 sq.jpg

for FILE in sq-*.jpg;
do
	rm "$(basename "$FILE" | sed 's/\(.*\)\..*/\1/')"-watermarked.jpg;
	convert $FILE $2 -composite $3/"$(basename "$FILE" | sed 's/\(.*\)\..*/\1/')"-watermarked.jpg;
	rm $FILE;
done
