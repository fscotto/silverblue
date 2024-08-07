#!/usr/bin/env bash

echo -e "\n\nInstall GNOME Extension CLI tool\n"
pipx install gnome-extensions-cli --system-site-packages

echo -e "Install GNOME Extensions\n"
extensions=(
  "clipboard-history@alexsaveau.dev"
  "drive-menu@gnome-shell-extensions.gcampax.github.com"
  "gnome-ui-tune@itstime.tech"
  "caffeine@patapon.info"
  "bluetooth-quick-connect@bjarosze.gmail.com"
  "user-theme@gnome-shell-extensions.gcampax.github.com"
  "no-overview@fthx"
)
for ext in "${extensions[@]}"; do
  gext install "$ext"
done

sudo cp ~/.local/share/gnome-shell/extensions/bluetooth-quick-connect@bjarosze.gmail.com/schemas/org.gnome.shell.extensions.bluetooth-quick-connect.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/caffeine@patapon.info/schemas/org.gnome.shell.extensions.caffeine.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/clipboard-history@alexsaveau.dev/schemas/org.gnome.shell.extensions.clipboard-indicator.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/gnome-ui-tune@itstime.tech/schemas/org.gnome.shell.extensions.gnome-ui-tune.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

echo -e "Configure GNOME Extensions\n"

# Background log
gsettings set org.fedorahosted.background-logo-extension logo-always-visible true

# Caffeine
gsettings set org.gnome.shell.extensions.caffeine inhibit-apps "['org.videolan.VLC.desktop']"

# Bluetooth Quick Connect
gsettings set org.gnome.shell.extensions.bluetooth-quick-connect show-battery-value-on true
