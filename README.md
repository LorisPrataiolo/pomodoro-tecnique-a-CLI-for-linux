# Pomodoro : A command shell for linux that implements Pomodoro Tecnique

## Tourn Script a Command-Line Utility

To make your Bash script a global command in Debian distros, you need to make it executable and place it in a directory that is part of your system's `PATH`.

### 1\. Make the Script Executable

First, navigate to the directory where your script file is located. Then, use the `chmod` command to add executable permissions:

```bash
chmod +x your_script_name.sh
```

### 2\. Create a Symbolic Link

To run the script from any directory, create a symbolic link (a shortcut) in `~/.local/bin`, a common location for user-specific commands.

1. Ensure the target directory exists:

    ```bash
    mkdir -p ~/.local/bin
    ```

2. Create the symbolic link:

    ```bash
    ln -s "$(pwd)/your_script_name.sh" ~/.local/bin/pomodoro
    ```

    This links your script from its current location to `~/.local/bin`, allowing you to run it using the `pomodoro` command from any terminal session.

You can now run your script by simply typing `pomodoro` in your terminal.

## Icon Credits

- **Pomodoro Icon**: [Timer icons](https://www.flaticon.com/free-icons/timer) by [Freepik](https://www.flaticon.com/authors/freepik) via [Flaticon](https://www.flaticon.com)  
- **Focus Icon**: [Focus icons](https://www.flaticon.com/free-icons/focus) by [Freepik](https://www.flaticon.com/authors/freepik) via [Flaticon](https://www.flaticon.com)  
- **Rest Icon**: [Rest icons](https://www.flaticon.com/free-icons/rest) by [Freepik](https://www.flaticon.com/authors/freepik) via [Flaticon](https://www.flaticon.com)
