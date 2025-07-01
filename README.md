<div align="center">

# `>_` pidcat: The Ultimate Logcat Companion 🚀

  <img src="https://github.com/anonfaded/pidcat/blob/master/screenshots/terminal.png" alt="Colored Logcat Output" width="750">

</div>

<div align="center">
  <p>
    This project is an enhanced fork of the original <strong><a href="https://github.com/JakeWharton/pidcat">pidcat script</a></strong>, revitalized with modern features for a cross-platform world.
  </p>
</div>

<p align="center">
<!--  <img src="https://img.shields.io/badge/Python-3.12+-blue.svg" alt="Python Version"> -->
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-brightgreen.svg" alt="Platforms">
</p>

Its primary enhancements provide full **Windows support** and **vastly improved user feedback**, making Android debugging a seamless experience on any operating system.

## ✨ Key Features

*   🖥️ **Truly Cross-Platform:** Works seamlessly on **Windows, macOS, and Linux**.
*   🎨 **Color-Coded Output:** Makes logs scannable by color-coding tags and log levels (Verbose, Debug, Info, Warn, Error).
*   📦 **Smart Package Filtering:** Automatically find an app's Process ID (PID) and show only relevant logs.
*   🗣️ **Verbose Feedback:** The script tells you what it's doing! It confirms device connections, finds PIDs, and warns you if a specified app isn't running—no more silent failures.
*   📱 **Multiple Device Support:** Interactive device selection when multiple devices are connected.
*   ⚡ **Windows Automation:** Includes an interactive `.bat` script to automate your logging session with a double-click.
*   ⚙️ **Powerful Filtering Options:** Filter by minimum log level, specific tags, and more.

## 📸 Screenshots

| Interactive Batch Script (Windows) | Colored pidcat Output (Cross-Platform) |
| :--------------------------------: | :------------------------------------: |
| ![windows batch file](https://github.com/anonfaded/pidcat/blob/master/screenshots/bat.png) | ![pidcat output](https://github.com/anonfaded/pidcat/blob/master/screenshots/terminal.png) |

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed and configured:

1.  **Python 3.6+**
2.  **Android SDK Platform-Tools:** You must have `adb.exe` in your system's PATH.
3.  **The `colorama` library:** This is essential for colors on Windows. Install it by running:
    ```bash
    pip install colorama
    ```

## 🚀 Usage

Run the script from your terminal, providing the package name of the app you want to monitor.

```bash
python pidcat.py [OPTIONS] [PACKAGE_NAME]
```

### Common Arguments

| Argument         | Alias | Description                                                  |
| ---------------- | :---: | ------------------------------------------------------------ |
| `package_name`   |  -    | The full package name of the app (e.g., `com.example.app`).  |
| `--clear`        |  `-c` | Clears the logcat buffer before starting the session.        |
| `--min-level`    |  `-l` | Sets the minimum log level to display (e.g., `W` for Warn).    |
| `--tag`          |  `-t` | Filters for specific log tags (can be used multiple times).  |
| `--current`      |  -    | Attaches to the app currently in the foreground.               |


## Windows

For Windows users, this project includes `start_logcat.bat` for an incredibly convenient workflow.

#### Features:
*   **Interactive:** Prompts you to enter a package name.
*   **Smart Default:** Suggests a default package if you just press Enter.
*   **Auto-Clears:** Automatically uses the `-c` flag to start a clean logging session.

#### How to Use:
1.  **(First Time Only)** Open `start_logcat.bat` in a text editor and ensure the path to `pidcat.py` is correct for your system.
2.  **Double-click** `start_logcat.bat`.
3.  Type a package name and press Enter. Your logcat session will begin instantly!


## 💡 Examples

**Monitor a specific app with a clean buffer:**
```bash
python pidcat.py -c com.yourapp.package
```

**Show only Warnings and Errors from the current foreground app:**
```bash
python pidcat.py --current -l W
```

**Filter for multiple specific tags:**
```bash
python pidcat.py -t "AuthService" -t "Database" com.yourapp.package
```

<br>

<details>
<summary><strong>Original Project README</strong></summary>

<br>

PID Cat
=======

An update to Jeff Sharkey's excellent [logcat color script][1] which only shows
log entries for processes from a specific application package.

During application development you often want to only display log messages
coming from your app. Unfortunately, because the process ID changes every time
you deploy to the phone it becomes a challenge to grep for the right thing.

This script solves that problem by filtering by application package. Supply the
target package as the sole argument to the python script and enjoy a more
convenient development process.

    pidcat com.oprah.bees.android


Here is an example of the output when running for the Google Plus app:

![Example screen](screen.png)


Install
-------

Get the script:

 *  OS X: Use [Homebrew][2].

         brew install pidcat

    If you need to install the latest development version

        brew unlink pidcat
        brew install --HEAD pidcat

 * Arch Linux : Install the package called `pidcat-git` from the [AUR][4].

 * Others: Download the `pidcat.py` and place it on your PATH.


Make sure that `adb` from the [Android SDK][3] is on your PATH. This script will
not work unless this is that case. That means, when you type `adb` and press
enter into your terminal something actually happens.

To include `adb` and other android tools on your path:

    export PATH=$PATH:<path to Android SDK>/platform-tools
    export PATH=$PATH:<path to Android SDK>/tools

Include these lines in your `.bashrc` or `.zshrc`.

*Note:* `<path to Android SDK>` should be absolute and not relative.

`pidcat` requires at least version 8.30 of `coreutils`. Ubuntu 20.04 LTS already ships
with it, for 18.04 and below, `coreutils` can be upgraded from the `focal` repo by running
the following:

```shell
sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu focal main restricted universe multiverse'
sudo apt-get update
sudo apt-get -t focal install coreutils
```

 [1]: http://jsharkey.org/blog/2009/04/22/modifying-the-android-logcat-stream-for-full-color-debugging/
 [2]: http://brew.sh
 [3]: http://developer.android.com/sdk/
 [4]: https://aur.archlinux.org/packages/pidcat-git/

</details>






























