# gh-config

A simple batch script to manage multiple Git configurations (profiles) on Windows.

## Description

`gh-config` allows you to easily switch between different Git user names and email addresses. This is useful if you work on multiple projects with different identities.

## Installation

1.  Download the `gh-config.bat` file.
2.  Place it in a directory of your choice (e.g., `C:\tools\gh-config`).
3.  Add the directory to your `PATH` environment variable.

    - **How to add to PATH (Windows):**
      - Search for "Edit the system environment variables" in the Start Menu.
      - Click "Environment Variables...".
      - In the "System variables" section, find the "Path" variable and click "Edit...".
      - Click "New" and add the directory where you saved `gh-config.bat` (e.g., `C:\tools\gh-config`).
      - Click "OK" on all the dialogs.

4.  Open a new command prompt or PowerShell window for the changes to take effect.

## Usage

```batch
gh-config create  (Creates a new Git profile)
gh-config use [profile] (Switches to the given Git profile)
gh-config list  (Lists all available Git profiles)
```
