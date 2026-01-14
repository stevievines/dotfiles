# Stevie's Dotfiles

This is based off of [Ben's Dotfiles Repo](https://github.com/subdigital/dotfiles). Thanks, Ben!

In this repository you'll find Stevie's dotfiles. I don't expect anyone to actually use these directly, but if you do, here's how you set it up. Keep in mind that I am not liable for any damage you do to your computer or files if you use these files.

## Structure

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) for managing symlinks. Each top-level directory is a "package" that can be installed independently:

```
dotfiles/
├── git/       # Git configuration (.gitconfig, .gitignore_global)
├── mise/      # Mise version manager config
├── nvim/      # Neovim configuration (Kickstart-based)
├── starship/  # Starship prompt configuration
└── zsh/       # Zsh shell configuration
```

## Homebrew Setup

This repo includes a `Brewfile` with all required tools and apps.

**On a new machine**, install everything:

```bash
brew bundle --file=~/dotfiles/Brewfile
```

**To update the Brewfile** after installing new tools:

```bash
brew bundle dump --force --file=~/dotfiles/Brewfile
```

**To check what's missing** from your current install:

```bash
brew bundle check --file=~/dotfiles/Brewfile
```

## Installation

Clone the repository:

```bash
git clone https://github.com/stevievines/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install packages with Stow:

```bash
# Install individual packages
stow git
stow zsh
stow nvim
stow starship
stow mise

# Or install all at once
stow git zsh nvim starship mise
```

To uninstall a package:

```bash
stow -D <package_name>
```

## Post-Installation

1. **Create secrets file**: Create `~/.secrets` for private environment variables (sourced by `.zshrc`)

2. **Restart shell**: `source ~/.zshrc` or open a new terminal

3. **Neovim plugins**: Launch `nvim` and let lazy.nvim auto-install plugins

4. **LSP servers**: Run `:Mason` in Neovim to install language servers (gopls, lua_ls, etc.)

5. **Mise tools**: Run `mise install` to install configured tool versions

## What's Included

### Git
- Useful aliases (`co`, `lg` for pretty log)
- Editor set to neovim
- Global gitignore for macOS/Xcode artifacts
- SSH credential helper for macOS

### Zsh
- Editor set to nvim
- PATH configured for Go, Python, and local binaries
- Git aliases (gst, gco, gb, ggpush)
- FZF configured with ripgrep
- Shell integrations: mise, zoxide, starship

### Neovim
Based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with lazy.nvim plugin manager.

Key features:
- Leader key: spacebar
- Relative line numbers, 80-column colorcolumn
- Tokyo Night color scheme
- Telescope fuzzy finder
- LSP support via Mason (gopls, lua_ls)
- Formatting with conform.nvim (goimports, gofumpt, stylua)
- GitHub Copilot integration
- Oil.nvim for file navigation
- Hop.nvim for quick cursor jumping

Custom keymaps:
- `jj`/`jk`: Escape insert mode
- `<C-p>`: Find files
- `<leader>w`: Save
- `<leader>q`: Quit
- `<leader>e`: Toggle file explorer

### Starship
Minimal configuration with AWS module disabled. Customize in `.config/starship.toml`.

### Mise
Manages tool versions:
- Node.js 24
- Ruby 4
