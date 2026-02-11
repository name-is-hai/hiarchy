---
name: hiarchy
description: >
  REQUIRED for ANY changes to Linux desktop, window manager, or system config.
  Use when editing ~/.config/hypr/, ~/.config/waybar/, ~/.config/walker/,
  ~/.config/alacritty/, ~/.config/kitty/, ~/.config/ghostty/, ~/.config/mako/,
  or ~/.config/hiarchy/. Triggers: Hyprland, window rules, animations, keybindings,
  monitors, gaps, borders, blur, opacity, waybar, walker, terminal config, themes,
  wallpaper, night light, idle, lock screen, screenshots, layer rules, workspace
  settings, display config, or any hiarchy-* commands.
---

# Hiarchy Skill

Manage [Hiarchy](https://hiarchy.org/) Linux systems - a beautiful, modern, opinionated Arch Linux distribution with Hyprland.

## When This Skill MUST Be Used

**ALWAYS invoke this skill when the user's request involves ANY of these:**

- Editing ANY file in `~/.config/hypr/` (window rules, animations, keybindings, monitors, etc.)
- Editing ANY file in `~/.config/waybar/`, `~/.config/walker/`, `~/.config/mako/`
- Editing terminal configs (alacritty, kitty, ghostty)
- Editing ANY file in `~/.config/hiarchy/`
- Window behavior, animations, opacity, blur, gaps, borders
- Layer rules, workspace settings, display/monitor configuration
- Themes, wallpapers, fonts, appearance changes
- Any `hiarchy-*` command
- Screenshots, screen recording, night light, idle behavior, lock screen

**If you're about to edit a config file in ~/.config/ on this system, STOP and use this skill first.**

## Critical Safety Rules

**NEVER modify anything in `~/.local/share/hiarchy/`** - but READING is safe and encouraged.

This directory contains Hiarchy's source files managed by git. Any changes will be:

- Lost on next `hiarchy-update`
- Cause conflicts with upstream
- Break the system's update mechanism

```
~/.local/share/hiarchy/     # READ-ONLY - NEVER EDIT (reading is OK)
├── bin/                    # Source scripts (symlinked to PATH)
├── config/                 # Default config templates
├── themes/                 # Stock themes
├── default/                # System defaults
├── migrations/             # Update migrations
└── install/                # Installation scripts
```

**Reading `~/.local/share/hiarchy/` is SAFE and useful** - do it freely to:

- Understand how hiarchy commands work: `cat $(which hiarchy-theme-set)`
- See default configs before customizing: `cat ~/.local/share/hiarchy/config/waybar/config.jsonc`
- Check stock theme files to copy for customization
- Reference default hyprland settings: `cat ~/.local/share/hiarchy/default/hypr/*`

**Always use these safe locations instead:**

- `~/.config/` - User configuration (safe to edit)
- `~/.config/hiarchy/themes/<custom-name>/` - Custom themes (must be real directories)
- `~/.config/hiarchy/hooks/` - Custom automation hooks

## System Architecture

Hiarchy is built on:

| Component                   | Purpose               | Config Location         |
| --------------------------- | --------------------- | ----------------------- |
| **Arch Linux**              | Base OS               | `/etc/`, `~/.config/`   |
| **Hyprland**                | Wayland compositor/WM | `~/.config/hypr/`       |
| **Waybar**                  | Status bar            | `~/.config/waybar/`     |
| **Walker**                  | App launcher          | `~/.config/walker/`     |
| **Alacritty/Kitty/Ghostty** | Terminals             | `~/.config/<terminal>/` |
| **Mako**                    | Notifications         | `~/.config/mako/`       |
| **SwayOSD**                 | On-screen display     | `~/.config/swayosd/`    |

## Command Discovery

Hiarchy provides ~145 commands following `hiarchy-<category>-<action>` pattern.

```bash
# List all hiarchy commands
compgen -c | grep -E '^hiarchy-' | sort -u

# Find commands by category
compgen -c | grep -E '^hiarchy-theme'
compgen -c | grep -E '^hiarchy-restart'

# Read a command's source to understand it
cat $(which hiarchy-theme-set)
```

### Command Categories

| Prefix              | Purpose                                   | Example                      |
| ------------------- | ----------------------------------------- | ---------------------------- |
| `hiarchy-refresh-*` | Reset config to defaults (backs up first) | `hiarchy-refresh-waybar`     |
| `hiarchy-restart-*` | Restart a service/app                     | `hiarchy-restart-waybar`     |
| `hiarchy-toggle-*`  | Toggle feature on/off                     | `hiarchy-toggle-nightlight`  |
| `hiarchy-theme-*`   | Theme management                          | `hiarchy-theme-set <name>`   |
| `hiarchy-install-*` | Install optional software                 | `hiarchy-install-docker-dbs` |
| `hiarchy-launch-*`  | Launch apps                               | `hiarchy-launch-browser`     |
| `hiarchy-cmd-*`     | System commands                           | `hiarchy-cmd-screenshot`     |
| `hiarchy-pkg-*`     | Package management                        | `hiarchy-pkg-install <pkg>`  |
| `hiarchy-setup-*`   | Initial setup tasks                       | `hiarchy-setup-fingerprint`  |
| `hiarchy-update-*`  | System updates                            | `hiarchy-update`             |

## Configuration Locations

### Hyprland (Window Manager)

```
~/.config/hypr/
├── hyprland.conf      # Main config (sources others)
├── bindings.conf      # Keybindings
├── monitors.conf      # Display configuration
├── input.conf         # Keyboard/mouse settings
├── looknfeel.conf     # Appearance (gaps, borders, animations)
├── envs.conf          # Environment variables
├── autostart.conf     # Startup applications
├── hypridle.conf      # Idle behavior (screen off, lock, suspend)
├── hyprlock.conf      # Lock screen appearance
└── hyprsunset.conf    # Night light / blue light filter
```

**Key behaviors:**

- Hyprland auto-reloads on config save (no restart needed for most changes)
- Use `hyprctl reload` to force reload
- Use `hiarchy-refresh-hyprland` to reset to defaults

### Waybar (Status Bar)

```
~/.config/waybar/
├── config.jsonc       # Bar layout and modules (JSONC format)
└── style.css          # Styling
```

**Waybar does NOT auto-reload.** You MUST run `hiarchy-restart-waybar` after any config changes.

**Commands:** `hiarchy-restart-waybar`, `hiarchy-refresh-waybar`, `hiarchy-toggle-waybar`

### Terminals

```
~/.config/alacritty/alacritty.toml
~/.config/kitty/kitty.conf
~/.config/ghostty/config
```

**Command:** `hiarchy-restart-terminal`

### Other Configs

| App       | Location                           |
| --------- | ---------------------------------- |
| btop      | `~/.config/btop/btop.conf`         |
| fastfetch | `~/.config/fastfetch/config.jsonc` |
| lazygit   | `~/.config/lazygit/config.yml`     |
| starship  | `~/.config/starship.toml`          |
| git       | `~/.config/git/config`             |
| walker    | `~/.config/walker/config.toml`     |

## Safe Customization Patterns

### Pattern 1: Edit User Config Directly

For simple changes, edit files in `~/.config/`:

```bash
# 1. Read current config
cat ~/.config/hypr/bindings.conf

# 2. Backup before changes
cp ~/.config/hypr/bindings.conf ~/.config/hypr/bindings.conf.bak.$(date +%s)

# 3. Make changes with Edit tool

# 4. Apply changes
# - Hyprland: auto-reloads on save (no restart needed)
# - Waybar: MUST restart with hiarchy-restart-waybar
# - Walker: MUST restart with hiarchy-restart-walker
# - Terminals: MUST restart with hiarchy-restart-terminal
```

### Pattern 2: Make a new theme

1. Create a directory under ~/.config/hiarchy/themes.
2. See how an existing theme is done via ~/.local/share/hiarchy/themes/catppuccin.
3. Download a matching background (or several) from the internet and put them in ~/.config/hiarchy/themes/[name-of-new-theme]
4. When done with the theme, run hiarchy-theme-set "Name of new theme"

### Pattern 3: Use Hooks for Automation

Create scripts in `~/.config/hiarchy/hooks/` to run automatically on events:

```bash
# Available hooks (see samples in ~/.config/hiarchy/hooks/):
~/.config/hiarchy/hooks/
├── theme-set        # Runs after theme change (receives theme name as $1)
├── font-set         # Runs after font change
└── post-update      # Runs after hiarchy-update
```

Example hook (`~/.config/hiarchy/hooks/theme-set`):

```bash
#!/bin/bash
THEME_NAME=$1
echo "Theme changed to: $THEME_NAME"
# Add custom actions here
```

### Pattern 4: Reset to Defaults -- ALWAYS SEEK USER CONFIRMATION BEFORE RUNNING

When customizations go wrong:

```bash
# Reset specific config (creates backup automatically)
hiarchy-refresh-waybar
hiarchy-refresh-hyprland

# The refresh command:
# 1. Backs up current config with timestamp
# 2. Copies default from ~/.local/share/hiarchy/config/
# 3. Restarts the component
```

## Common Tasks

### Themes

```bash
hiarchy-theme-list              # Show available themes
hiarchy-theme-current           # Show current theme
hiarchy-theme-set <name>        # Apply theme (use "Tokyo Night" not "tokyo-night")
hiarchy-theme-next              # Cycle to next theme
hiarchy-theme-bg-next           # Cycle wallpaper
hiarchy-theme-install <url>     # Install from git repo
```

### Keybindings

Edit `~/.config/hypr/bindings.conf`. Format:

```
bind = SUPER, Return, exec, xdg-terminal-exec
bind = SUPER, Q, killactive
bind = SUPER SHIFT, E, exit
```

View current bindings: `hiarchy-menu-keybindings --print`

**IMPORTANT: When re-binding an existing key:**

1. First check existing bindings: `hiarchy-menu-keybindings --print`
2. If the key is already bound, you MUST add an `unbind` directive BEFORE your new `bind`
3. Inform the user what the key was previously bound to

Example - rebinding SUPER+F (which is bound to fullscreen by default):

```
# Unbind existing SUPER+F (was: fullscreen)
unbind = SUPER, F
# New binding for file manager
bind = SUPER, F, exec, nautilus
```

Always tell the user: "Note: SUPER+F was previously bound to fullscreen. I've added an unbind directive to override it."

### Display/Monitors

Edit `~/.config/hypr/monitors.conf`. Format:

```
monitor = eDP-1, 1920x1080@60, 0x0, 1
monitor = HDMI-A-1, 2560x1440@144, 1920x0, 1
```

List monitors: `hyprctl monitors`

### Window Rules

**CRITICAL: Hyprland window rules syntax changes frequently between versions.**

Before writing ANY window rules, you MUST fetch the current documentation from the official Hyprland wiki:

- https://github.com/hyprwm/hyprland-wiki/blob/main/content/Configuring/Window-Rules.md

DO NOT rely on cached or memorized window rule syntax. The format has changed multiple times and using outdated syntax will cause errors or unexpected behavior.

Window rules go in `~/.config/hypr/hyprland.conf` or a sourced file. Always verify the current syntax from the wiki first.

### Fonts

```bash
hiarchy-font-list               # Available fonts
hiarchy-font-current            # Current font
hiarchy-font-set <name>         # Change font
```

### System

```bash
hiarchy-update                  # Full system update
hiarchy-version                 # Show Hiarchy version
hiarchy-debug --no-sudo --print # Debug info (ALWAYS use these flags)
hiarchy-lock-screen             # Lock screen
hiarchy-cmd-shutdown            # Shutdown
hiarchy-cmd-reboot              # Reboot
```

**IMPORTANT:** Always run `hiarchy-debug` with `--no-sudo --print` flags to avoid interactive sudo prompts that will hang the terminal.

## Troubleshooting

```bash
# Get debug information (ALWAYS use these flags to avoid interactive prompts)
hiarchy-debug --no-sudo --print

# Upload logs for support
hiarchy-upload-log

# Reset specific config to defaults
hiarchy-refresh-<app>

# Refresh specific config file
# config-file path is relative to ~/.config/
# eg. hiarchy-refresh-config hypr/hyprlock.conf will refresh ~/.config/hypr/hyprlock.conf
hiarchy-refresh-config <config-file>

# Full reinstall of configs (nuclear option)
hiarchy-reinstall
```

## Decision Framework

When user requests system changes:

1. **Is it a stock hiarchy command?** Use it directly
2. **Is it a config edit?** Edit in `~/.config/`, never `~/.local/share/hiarchy/`
3. **Is it a theme customization?** Create a NEW custom theme directory
4. **Is it automation?** Use hooks in `~/.config/hiarchy/hooks/`
5. **Is it a package install?** Use `yay`
6. **Unsure if command exists?** Search with `compgen -c | grep hiarchy`

## Development (AI Agents)

When contributing to Hiarchy itself (e.g., fixing bugs, adding features), migrations are used to apply changes to existing installations.

### Creating Migrations

```bash
# ALWAYS use --no-edit flag or you will get stuck
hiarchy-dev-add-migration --no-edit
```

This creates a new migration file and outputs its path without opening an editor. The migration filename is based on the git commit timestamp.

**Migration files** are shell scripts in `~/.local/share/hiarchy/migrations/` that run once per system during `hiarchy-update`. Use them for:

- Updating user configs with new defaults
- Installing new dependencies
- Running one-time setup tasks

## Example Requests

- "Change my theme to catppuccin" -> `hiarchy-theme-set catppuccin`
- "Add a keybinding for Super+E to open file manager" -> Check existing bindings first, add `unbind` if needed, then add `bind` in `~/.config/hypr/bindings.conf`
- "Configure my external monitor" -> Edit `~/.config/hypr/monitors.conf`
- "Make the window gaps smaller" -> Edit `~/.config/hypr/looknfeel.conf`
- "Set up night light to turn on at sunset" -> `hiarchy-toggle-nightlight` or edit `~/.config/hypr/hyprsunset.conf`
- "Customize the catppuccin theme colors" -> Create `~/.config/hiarchy/themes/catppuccin-custom/` by copying from stock, then edit
- "Run a script every time I change themes" -> Create `~/.config/hiarchy/hooks/theme-set`
- "Reset waybar to defaults" -> `hiarchy-refresh-waybar`
