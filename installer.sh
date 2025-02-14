#!/bin/bash

echo "mkdir -p ~/.local/share/ts-app"
mkdir -p ~/.local/share/ts-app

echo "cp -r config ~/.local/share/ts-app"
cp -r config ~/.local/share/ts-app

echo "mkdir -p ~/.local/bin"
mkdir -p ~/.local/bin

echo "cp ts-app ~/.local/bin"
cp ts-app ~/.local/bin

ADD_BIN_PATH="export PATH=\"$HOME/.local/bin:$PATH\""

if [[ $SHELL == "/bin/bash" ]]; then
  echo "Detected Bash shell. Updating ~/.bashrc"
  echo "$ADD_BIN_PATH" >> "$HOME/.bashrc"
elif [[ $SHELL == "/bin/zsh" ]]; then
  echo "Detected Zsh shell. Updating ~/.zshrc"
  echo "$ADD_BIN_PATH" >> "$HOME/.zshrc"
else
  echo "Unsupported shell: $SHELL"
  echo "Please manually add the following line to your shell configuration file:"
  echo "$ADD_BIN_PATH"
fi

cat <<EOF

-------------------------------
   Installed successfully !!
-------------------------------

EOF

echo "To remove the script: ts-app --remove"


