#!/bin/bash

log() {
  if [[ $QUIET == false ]]; then
    printf "$1"
  fi
}

if [ -z "$1" ]; then
  printf 'No directory provided\n'
  printf "Usage: $(basename $0) <directory>\n"
  exit 1
fi

printf 'This will create a app with eslint, prettier, nodemon and typescript setup\n' | lolcat

QUIET=false
CONF_DIR_PATH=$(realpath 'config')
DEST_DIR_PATH=$(realpath $1)

if [[ $2 == '-q' || $2 == '--quiet' ]]; then
  QUIET=true
fi

if [ ! -d "$DEST_DIR_PATH" ]; then 
  printf "# Creating directory\n" | lolcat
  mkdir -p $DEST_DIR_PATH
fi


printf "# Coping all config files in your app \n" | lolcat
for file in "$CONF_DIR_PATH"/* "$CONF_DIR_PATH"/.*; do

  filename=$(basename "$file")
  log "Coping $filename\n"

  dest_file="$DEST_DIR_PATH/$filename"

  if [ -e "$dest_file" ]; then
    backup_file="$dest_file-backup"
    mv $dest_file $backup_file
  fi

  cp -r $file $DEST_DIR_PATH
done

printf "# Installing packages\n" | lolcat
if [[ $QUIET == false ]]; then
  (cd $DEST_DIR_PATH && pnpm install)
else
  (cd $DEST_DIR_PATH && pnpm install 2>/dev/null 1>/dev/null)
fi

printf "# Running the app\n" | lolcat
(cd $DEST_DIR_PATH && pnpm start)
