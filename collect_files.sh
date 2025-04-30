#!/bin/bash

Input="$1"
Output="$2"

for current_path in $(find "$Input" -type f); do
	current_file=$(basename "$current_path")
	save="$Output/$current_file"
	c=1
	while [ -e "$save" ]; do
		save="$Output/${current_file%.*}$c.${current_file##*.}"
		c=$((c + 1))
	done
	cp "$current_path" "$save"
done