
# Assignment - 4 - Script - 3


#!/bin/bash

read -p "Enter a sentence: " SENTENCE

# tr (transform function) is used to swap spaces with newline here
# sort functions sort the words so same words come together
# uniq : give final list with the word count
# also using transform for lower case transformation

echo "$SENTENCE" | tr 'A-Z' 'a-z' | tr ' ' '\n' | sort | uniq -c | while read -r COUNT WORD
do
	echo "Word: '$WORD' -> Occurences: $COUNT"
done
