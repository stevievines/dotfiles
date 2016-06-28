# Stevie's Dotfiles

This is based off of [Ben's Dotfiles Repo](https://github.com/subdigital/dotfiles). Thanks, Ben!

In this repository you'll find Stevie's dotfiles.  I don't expect anyone to actually use these directly, but if you do, here's how you set it up.  Keep in mind that I
am not liable for any damage you do to your computer or files if you use these files.

## Prerequisites

- Some version of ruby
- `rake` and the `colored` gems installed locally
- [A patched font](https://gist.github.com/kevin-smets/8568070#install-a-patched-font)

## Symlinking these files

Clone the directory somewhere (I chose `~/Dropbox/dotfiles` so it would be easily synced across my machines).  Make sure
you grab the submodules too, as the vim plugins are added as submodules.

```
git clone https://github.com/stevievines/dotfiles.git
git submodule update --init --recursive
```

Then we need to symlink these into your home directory.  Run:

```
rake symlink
```

This will symlink all of the dotfiles from the repo into your home folder.  It will prompt before overwriting files, so you
can skip existing ones if you want.


I highly recommend you back up any existing dotfiles before trying this out.  Use at your own risk.

## iTerm2 Setup
I use iTerm2 for development, and recommend installing the solarized color scheme. [Instructions here](https://gist.github.com/kevin-smets/8568070#iterm2)
