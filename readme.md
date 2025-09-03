# Proxmox Subscription Nag Remover

A small script to remove the “No valid subscription” notice in Proxmox VE’s web interface by modifying the JavaScript file responsible for subscription checks.

## Features

* Backs up the original `proxmoxlib.js` file.
* Replaces the first occurrence of the subscription check condition.
* Restarts the `pveproxy` service to apply changes.
* Provides clear instructions to clear browser cache and reload the site.

---

## Usage

You can run the script directly on your Proxmox server:

```bash
# Download and run the script
bash <(curl -s https://raw.githubusercontent.com/MartinMustafa/proxmox-subscription-nag-remover/refs/heads/main/nag-remover.sh)
```

---

## What it does

1. Makes a backup of the original file:

```bash
/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js.bak
```

2. Replaces the first occurrence of:

```js
res.data.status.toLowerCase() !== 'active'
```

with:

```js
res.data.status.toLowerCase() == 'active'
```

3. Restarts the `pveproxy` service.
4. Prints instructions to clear your browser cache and reload the site.

---

## Notes

* The script **exits immediately** if any command fails (`set -e`).
* After running, you may temporarily lose webshell connection while the service restarts.
* Keep the backup file in case you want to revert the changes.

---

I can also create a **one-paragraph “README.md ready” version** that is even shorter and minimal for GitHub if you want.

Do you want me to do that?
