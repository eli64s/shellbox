# Zsh Configuration Files Overview

This guide provides a concise explanation of the Zsh configuration files, their purposes, and the order in which they are executed. Understanding these files will help you customize your Zsh environment effectively.

## Configuration Files and Their Purposes

### 1. `.zshenv` (Optional)

- **Purpose**: Executed for **every** shell invocation, both interactive and non-interactive.
- **Use Case**: Set environment variables that need to be available in all shell sessions, including scripts run by system processes like `launchd`.
- **Note**: Use cautiously, as it affects all Zsh sessions. Typically for advanced users.

### 2. `.zprofile`

- **Purpose**: Executed for **login shells**.
- **Use Case**: Configure environment variables and settings that should be set upon user login.
- **Note**: Similar to Bash's `.bash_profile`. Preferred on macOS, especially if migrating from Bash.

### 3. `.zshrc`

- **Purpose**: Executed for **interactive shells**.
- **Use Case**: Define aliases, functions, shell options, and other interactive shell configurations.
- **Note**: Ideal for "set it and forget it" settings that enhance your interactive experience.

### 4. `.zlogin` (Less Common)

- **Purpose**: Also executed for **login shells**, but **after** `.zshrc`.
- **Use Case**: Historically derived from C Shell's `.login`. Can be used similarly to `.zprofile`.
- **Note**: On macOS, it's common to use `.zprofile` instead.

### 5. `.zlogout` (Optional)

- **Purpose**: Executed during **logout**.
- **Use Case**: Perform cleanup tasks like resetting terminal settings or saving history.
- **Note**: Useful for maintaining a clean environment between sessions.

## Execution Order

The order in which Zsh reads these files depends on the type of shell being started.

```mermaid
graph LR
    A[.zshenv] --> B[.zprofile]
    B --> C[.zshrc]
    C --> D[.zlogin]
    D --> E[.zlogout]
```

### For **Login Shells**:

1. `.zshenv`
2. `.zprofile`
3. `.zshrc`
4. `.zlogin`

### For **Interactive Non-Login Shells**:

1. `.zshenv`
2. `.zshrc`

### For **Non-Interactive Shells** (e.g., scripts):

1. `.zshenv`

## macOS Specifics

- **Terminal Behavior**: Opening a new Terminal window starts a **login** and **interactive** shell, executing both `.zprofile` and `.zshrc`.
- **Subshells**: Starting a new shell within Terminal (e.g., typing `zsh`) starts an **interactive** shell but not a login shell; only `.zshrc` is executed.
- **SSH Sessions**: Logging in via SSH initiates a **login** and **interactive** shell, executing both `.zprofile` and `.zshrc`.

## Recommendations

- **Environment Variables**: Place global environment variables in `.zshenv` if they need to be available in all sessions, including non-interactive ones.
- **Login Configurations**: Use `.zprofile` for settings that should apply during login.
- **Interactive Configurations**: Use `.zshrc` for aliases, functions, and interactive shell customizations.
- **Portability in Scripts**: For scripts run by system processes, define necessary environment variables within the script to ensure portability.
- **Cleanup**: Utilize `.zlogout` for any tasks that should run upon exiting the shell.

## Tips

- **Avoid Duplication**: Do not duplicate configurations across multiple files to prevent conflicts and maintenance issues.
- **Custom Functions and Aliases**: Keep these in `.zshrc` to enhance your interactive shell experience.
- **Testing Configurations**: After making changes, you can source the files (e.g., `source ~/.zshrc`) to apply them without restarting the shell.

## Additional Resources

- **Zsh Manual - Startup/Shutdown Files**: [Zsh Documentation](http://zsh.sourceforge.net/Doc/Release/Startup-And-Shutdown-Files.html)
- **Understanding Shell Types**:
  - **Login Shell**: A shell that requires user authentication. Reads `.zprofile` and `.zlogin`.
  - **Interactive Shell**: A shell that interacts with the user (e.g., accepts keyboard input). Reads `.zshrc`.
  - **Non-Interactive Shell**: Runs scripts and commands without user interaction. Reads `.zshenv`.

## References

- [zsh-zprofile-zshrc-zlogin-what-goes-where](https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where)

---
