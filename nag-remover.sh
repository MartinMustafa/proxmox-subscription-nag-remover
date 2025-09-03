#!/bin/bash
set -e  # Exit immediately if any command fails

path="/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js"

# Make backup
cp "$path" "$path.bak"

# Replace first occurrence
sed -i '0,/res\.data\.status\.toLowerCase() !== '\''active'\''/s//res.data.status.toLowerCase() == '\''active'\''/' "$path"

echo "============================================================"
echo "✅  DONE! Please clear your browser cache and reload the site"
echo "------------------------------------------------------------"
echo "⚠️  Restarting the Proxmox service to apply the tweak."
echo "    You may temporarily lose webshell connection."
echo "============================================================"


# Restart service
systemctl restart pveproxy.service
