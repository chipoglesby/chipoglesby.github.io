#!/bin/bash

cd _posts/blog || exit

for file in *; do
  sed -i 's,http://gist-it.appspot.com/,https://gist-it.appspot.com/,g' "$file"
done

