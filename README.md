Got tired of setting up ESLint, Prettier, Nodemon, and TypeScript repeatedly.So I created this handy script to simplify the process.

Feel free to use it however you like! If you'd like to use it my way:

Just install the script, simply run:
```bash
./installer.sh
```
What it does ??
- Copies the `installer.sh` script to `~/.local/bin`.

- Copies the config folder to `~/.local/share`.

- Adds this line to your shell configuration file (e.g., `~/.bashrc` or `~/.zshrc`):
```bash
export PATH="$HOME/.local/bin:$PATH"
```

Replace {username} with your actual username. After saving, reload your shell configuration.

Once set up, you can use the script from anywhere like this:
```bash
ts-app express-app
```

It will create a directory `express-app` where you called the script, other than that you can give it any other path.
```bash
ts-app ~/Workspace/express-app
```

You can also use `--quiet` or `-q` to hide the logs.
```bash
ts-app -q ~/Workspace/express-app
```

## For now the script will only work on UNIX-like systems.
Make sure you have basic dependencies like `node, npm, realpath, basename` is installed in your machine.
