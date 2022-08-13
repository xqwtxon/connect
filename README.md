# Connect.sh
A Powerful URL Connect Test

# Usage
| **Options** | **Description** |
|-------------|-----------------|
| `--help, -h` | Displays Command Information |
| `--silent, -s` | Silent Mode Connect Test |
| `--progress, -p` | Show Progress Bar Connect Test |
| `--no-exit, -n` | Prints ONLY Status Code. |
| `--verbose, -b` | Prints ONLY Debug Connect Test. |
| `--version, -v` | Prints the Software Version |
| `--update, -u`  | Update the Software |

# Updating to Latest
Upgrading to Latest should be online.

- Run the following command `connect --update`
  - If you are using v0.0.1, execute the following command:
    ```sh
    curl -sL https://raw.githubusercontent.com/xqwtxon/connect.sh/stable/src/connect/update.sh -o "update.sh" && chmod +x "update.sh" && bash "update.sh" --update
    ```
- Enjoy, use the 'connect --version' to check version!
  - If you're experiencing `Permission Denied` on `cp`, that means you must resolve the permissions between `$PREFIX/bin`.

# Testing Connections
Use the following command to test connection on the url.

> **Warning**
> If your url doesnt start with `https:// or http:// or with .` that is not valid url

```sh
connect https://example.com
```

> **Note**
> You can use `connect -p https://example.com` to check connection whether bad or ok.
