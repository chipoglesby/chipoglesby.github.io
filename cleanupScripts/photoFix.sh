#!/bin/bash

cd _posts/blog || exit

for file in *; do
  # sed -i 's,http://www.chipoglesby.com/wp-content/uploads/,https://storage.googleapis.com/www.chipoglesby.com/wp-content/uploads/,g' "$file"
  
  # This works for Mac:
  sed -i'' -e 's,https://storage.googleapis.com/www.chipoglesby.com/wp-content/uploads/[[:digit:]]\{4\}/[[:digit:]]\{2\},https://storage.googleapis.com/www.chipoglesby.com,g' "$file"
done

