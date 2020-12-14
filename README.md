# Stevie's Dotfiles

This is based off of [Ben's Dotfiles Repo](https://github.com/subdigital/dotfiles). Thanks, Ben!

In this repository you'll find Stevie's dotfiles.  I don't expect anyone to actually use these directly, but if you do, here's how you set it up.  Keep in mind that I
am not liable for any damage you do to your computer or files if you use these files.

## General Thing
I followed this to setup nvim as go IDE: https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/

## Prerequisites

- Some version of ruby
- neovim (installed via `brew install neovim`)
- zsh (`brew install zsh`)
- oh-my-zsh (https://ohmyz.sh/#install) 
- Node (https://github.com/neoclide/coc.nvim) for coc.nvim language server stuff
- Yarn (for cocnvim go IDE stuff; `brew install yarn`)
- Terraform (for vim TerraformFmt to work; `brew install terraform`)
- Ripgrep (for FZF configuration; `brew install ripgrep`)
- NOTE had some certificates issues on most recent go, due to a specified cert.pem in my zshrc, which I disabled but left in there for future me.

## Symlinking these files

Clone the directory somewhere (I chose `~/Dropbox/dotfiles` so it would be easily synced across my machines). 

```
git clone https://github.com/stevievines/dotfiles.git
```

Then we need to symlink these into your home directory.  Run:

```
rake symlink
```

This will symlink all of the dotfiles from the repo into your home folder.  It will prompt before overwriting files, so you
can skip existing ones if you want.

I highly recommend you back up any existing dotfiles before trying this out.  Use at your own risk.

## iTerm2 Setup
I use iTerm2 for development, and recommend installing the nord color scheme. [Instructions here](https://github.com/arcticicestudio/nord-iterm2)

## Neovim
I (sometimes?) use neovim, which required a couple of additional steps:
```
 ln -s ~/.vim ~/.config/nvim
 ln -s ~/.vimrc ~/.config/nvim/init.vim # I just deleted the file that was currently there
```

 ## Plugin Installation
 Open vim and run `:PlugInstall` to install the plugins
 Also run :GoInstallBinaries to install required go binaries

 ## Configure Coc Settings for golang language server
 Open vim and run :CocConfig
 Paste these settings and write file:
 ```json
 {
  "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
      "filetypes": ["go"]
    }
  }
}
```

TODO: figure out if there are any gotchas for also adding .config/nvim/ dir here and symlinking...
