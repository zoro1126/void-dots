# Void Dots 
Minimal, fully keyboard-driven Hyprland setup.  
Black & white only. No animations. No bloat. Just clean and fast.

---
## Quick Install (after fresh Arch setup)
```bash
# Clone repo
git clone https://github.com/zoro1126/void-dots.git
cd void-dots

# Run setup
bash setup.sh
```
Then restart Hyprland:
```bash
hyprctl reload
```
---
## Required Packages
Install these on Arch (recommended):
```bash
sudo pacman -S hyprland waybar kitty rofi yazi fish starship fastfetch rofi \
pipewire wireplumber wl-clipboard networkmanager-dmenu
```
---
## Config Overview
```
.config
├── fastfetch/        # Custom fetch with ASCII/images
├── fish/             # Shell config
├── hypr/             # Hyprland config
├── kitty/            # Terminal config (B&W theme)
├── starship.toml     # Shell prompt
├── rofi/             # custom menu
├── yazi/             # TUI file browser
└── waybar/           # Bar config + styling
```
Everything else is stripped out for a clean rice.

---

## Key Features

| Component | Description                                 |
| --------- | ------------------------------------------- |
| Hyprland  | Minimal compositor (no animation, no fluff) |
| Kitty     | Grayscale terminal                          |
| Fish      | Custom fetch on startup                     |
| Waybar    | Lightweight bar                             |
| Fastfetch | Random ASCII or image logo                  |
| Yazi      | A TUI file browser                          |  
| Rofi      | A GUI menu used for Desktop overview, apps  |
| Starship  | Clean prompt                                |

Only what’s needed. Nothing else.

---
## Notes
- It is for my personal use and may have to be tweaked for other users.
- Use Kitty → Fish terminal for intended experience.
- No media controls in Waybar (intentional).
- Resize/move windows using Hyprland keybinds.
- Ideal for users who rice manually.
---
## Author
**zoro1126**  
Probably ricing instead of doing something “productive” (Uses arch btw)

---
## Future Plans
- [ ] Create a productive calendar widget in quickshell or ewww with to-do functionality, etc
- [ ] Create some ml models to aid in the productivity system
---
## Setup Script
A `setup.sh` script is included in the repo to:
- Copy configs to `~/.config`
- Install dependencies (or let the script do it)
- Set permissions : `sudo chmod +x setup.sh`
Run it after cloning.
---
## Happy ricing.
