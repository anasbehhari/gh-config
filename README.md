# gh-config

A simple batch script to manage multiple Git profiles.

## Description

This script allows you to easily create, switch between, list, and delete different Git configurations. It's useful for managing different Git identities for work, personal projects, etc.

## Usage

1.  **Download:** Download the `gh-config.bat` file.
2.  **Save:** Save it to a convenient location on your system (e.g., `C:\gh-config`).
3.  **Add to PATH (Optional but Recommended):** Add the directory where you saved `gh-config.bat` to your system's PATH environment variable. This will allow you to run the script from any directory in your terminal.
4.  **Run:** Open a command prompt or terminal and use the following commands:

    - `gh-config create`: Creates a new Git profile.
    - `gh-config use [profile_name]`: Switches to the specified Git profile.
    - `gh-config list`: Lists all available Git profiles.
    - `gh-config delete [profile_name]`: Deletes the specified Git profile.
    - `gh-config`: Lists all available Git profiles (default action).

## Example

```bash
gh-config create
Enter profile name: work
Enter email: [email address removed]
Enter username: Work User

gh-config use work

gh-config list
```
