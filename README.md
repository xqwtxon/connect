# Connect.sh
A Powerful URL Connect Test

# Usage
| **Options** | **Description** | **Usage** | **Status** |
|-------------|-----------------|-----------|------------|
| `--help, -h` | Displays Command Information | `connect --help [command_name]` | ![](https://img.shields.io/badge/Status-Not%20Finished-red?style=flat-square&logo=github) |
| `--silent, -s` | Silent Mode Connect Test | `connect --silent https://example.com/` | ![](https://img.shields.io/badge/Status-Finished-brightgreen?style=flat-square&logo=github) |
| `--progress, -p` | Show Progress Bar Connect Test | `connect --progress https://example.com/` | ![](https://img.shields.io/badge/Status-Finished-brightgreen?style=flat-square&logo=github) |
| `--no-exit, -n` | Prints ONLY Status Code. | `connect --no-exit https://example.com/` | ![](https://img.shields.io/badge/Status-Finished-brightgreen?style=flat-square&logo=github) |
| `--verbose, -b` | Prints ONLY Debug Connect Test. | `connect --verbose https://example.com/` | ![](https://img.shields.io/badge/Status-Finished-brightgreen?style=flat-square&logo=github) |
| `--version, -v` | Prints the Software Version | `connect --version` | ![](https://img.shields.io/badge/Status-Finished-brightgreen?style=flat-square&logo=github) |
| `--update, -u`  | Update the Software | `connect --update` | ![](https://img.shields.io/badge/Status-Not%20Finished-red?style=flat-square&logo=github) |

# Installation ![](https://img.shields.io/badge/Status-Finished-brightgreen?style=flat-square&logo=github)
- Run the following command to install the following items:
  ```sh
  curl -sL https://raw.githubusercontent.com/xqwtxon/connect.sh/stable/src/connect/setup.sh | bash -s -
  ```
- It will install the following requirements.
- When installation is done, you can now start executing: `connect --help`!

# Updating ![](https://img.shields.io/badge/Status-Not%20Finished-red?style=flat-square&logo=github)
Upgrading to Latest should be online.

- Run the following command `connect --update`
  - If you are using v0.0.1, execute the following command:
    ```sh
    curl -sL https://raw.githubusercontent.com/xqwtxon/connect.sh/stable/src/connect/update.sh -o "update.sh" && chmod +x "update.sh" && bash "update.sh" --update
    ```
- Enjoy, use the 'connect --version' to check version!
  - If you're experiencing `Permission Denied` on `cp`, that means you must resolve the permissions between `$PREFIX/bin`.

# Testing Connections ![](https://img.shields.io/badge/Status-Finished-brightgreen?style=flat-square&logo=github)
Use the following command to test connection on the url.

> **Warning**
>
> If your url doesnt start with `https:// or http:// or with .` that is not valid url

```sh
connect https://example.com
```

> **Note**
>
> You can use `connect -p https://example.com` to check connection whether bad or ok.
