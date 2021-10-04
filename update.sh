#! /bin/bash 

for filename in $(ls ./configs/)
do
	cp ./configs/$filename $HOME/.$filename
done

echo "Copied all files from configs to $HOME" 
