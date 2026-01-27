#!/usr/bin/env bash

set -e

echo "void-dots setup starting..."

CONFIG_DIR="$HOME/.config"
REPO_CONFIG_DIR="$(pwd)/.config"

REQUIRED_PACKAGES=(
    hyprland waybar kitty fish starship fastfetch rofi-wayland
    pipewire wireplumber wl-clipboard networkmanager-dmenu yazi
)

echo "Installing required packages..."
sudo pacman -S --needed --noconfirm "${REQUIRED_PACKAGES[@]}"

echo "Copying configs to $CONFIG_DIR..."
mkdir -p "$CONFIG_DIR"

for dir in hypr waybar kitty fish fastfetch rofi yazi; do
    if [ -d "$REPO_CONFIG_DIR/$dir" ]; then
        rm -rf "$CONFIG_DIR/$dir"
        cp -r "$REPO_CONFIG_DIR/$dir" "$CONFIG_DIR/"
        echo "  copied $dir"
    fi
done

cp "$REPO_CONFIG_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

if [ -d "$CONFIG_DIR/waybar/scripts" ]; then
    chmod +x "$CONFIG_DIR/waybar/scripts"/*.sh
fi

echo "Configuring auto-login into Hyprland on TTY1..."

BASH_PROFILE="$HOME/.bash_profile"

# Add auto-login logic
cat > "$BASH_PROFILE" << 'EOF'
# Auto login Hyprland only on tty1
if [ -z "$DESKTOP_SESSION" ] && [ "$XDG_VTNR" = "1" ] && [ -z "$SSH_TTY" ]; then
    exec hyprland-start
fi
EOF

echo ".bash_profile updated with auto-start logic"

echo "Setup complete."
echo "To make fish default shell: chsh -s /usr/bin/fish"
echo "Reboot or switch to tty1 and login to start Hyprland."
