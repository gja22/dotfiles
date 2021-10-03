# dotfiles

## Installation
Clone the repo to your desired location. I tend to place it in my home directory.

`cd`

`git clone https://github.com/gja22/dotfiles.git`

Which clones my dotfile repo into: `~/dotfiles`.

## Bash Configuration
In your home directory run the following commands:

`ln -s dotfiles/bash_profile .bash_profile`

`ln -s dotfiles/bashrc .bashrc`

Where `dotfiles` is the location of the cloned dotfiles repo.

## Vim Configuration
In the `~/.vim` directory run the following commands:

`ln -s ~/dotfiles/vimrc vimrc`

### Vim Color Schemes
I use the solarized color scheme.

To install first clone the git repo to a location of your preference.

`git clone git://github.com/altercation/vim-colors-solarized.git`

Then copy the color file to the right Vim directory.

`cd vim-colors-solarized/colors`
`mv solarized.vim ~/.vim/colors/`

Now modify .vimrc (this is already in my default vimrc file):

```
syntax enable
set background=dark
solorscheme solarized
```

### Vim Packages



