#!/bin/bash

cd _posts/blog || exit

for file in *; do
  sed -i 's/- Sidenote/- sidenote/g' "$file"
done
