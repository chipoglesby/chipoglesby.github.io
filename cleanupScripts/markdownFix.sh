#!/bin/bash

cd _posts/blog

for file in *; do
  if [[ "$file" =~ \.markdown$ ]]; then
    echo "${file::-9}"  
    # "$file" > "${file::8}.tmp"
  fi
done


# To fix the sed error
# for file in *-e ; do mv "$file" "`echo $file | sed 's/-e//'`" ; done

# To change .markdown to .md
# for file in *.markdown ; do mv "$file" "`echo $file | sed 's/.markdown/.md/'`" ; done
