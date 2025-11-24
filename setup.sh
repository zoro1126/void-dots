#!/usr/bin/env bash

set -e

echo "🚀 void-dots setup starting..."

# --- Define dirs ---
CONFIG_DIR="$HOME/.config"
REPO_CONFIG_DIR="$(pwd)/.config"

# --- Packages to install ---
REQUIRED_PACKAGES=(
    hyprland waybar kitty fish starship fastfetch rofi
    pipewire wireplumber wl-clipboard networkmanager-dmenu
)

# --- Install required packages ---
echo "📦 Installing required packages..."
sudo pacman -S --needed --noconfirm "${REQUIRED_PACKAGES[@]}"

# --- Copy configs ---
echo "🗂 Copying configs to $CONFIG_DIR..."
mkdir -p "$CONFIG_DIR"

for dir in hypr waybar kitty fish fastfetch; do
    if [ -d "$REPO_CONFIG_DIR/$dir" ]; then
        rm -rf "$CONFIG_DIR/$dir"               # Clean existing
        cp -r "$REPO_CONFIG_DIR/$dir" "$CONFIG_DIR/"
        echo "  ✓ $dir"
    fi
done

# Copy standalone file
cp "$REPO_CONFIG_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

# --- Set script permissions ---
if [ -d "$CONFIG_DIR/waybar/scripts" ]; then
    chmod +x "$CONFIG_DIR/waybar/scripts"/*.sh
fi

# --- Optional fish default (disabled intentionally) ---
echo "🐟 (Optional) To set fish as default shell:"
echo "    chsh -s /usr/bin/fish"
# Uncomment to auto set:
# chsh -s /usr/bin/fish

# --- Done ---
echo "✨ Setup complete!"
echo "👉 Restart Hyprland or run: hyprctl reload"
echo "👉 Open a new Kitty window to test Fish & Fastfetch"
