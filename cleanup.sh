#! /usr/bin/env sh

if ! [ -d "plugged" ]; then
  exit 0
fi

for folder in ./plugged/*; do
  if [ -d "$folder" ]; then
    echo "cleanup $folder ..."
    {
      cd "$folder"
      git fetch --depth=1 --update-shallow -t -p
      git gc
      git prune
      cd -
    } &> /dev/null
  fi
done
