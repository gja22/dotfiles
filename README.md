# dotfiles

## Installation
Clone the repo to your desired location. I keep it in `~/gja22/dotfiles`.

`cd ~/gja22`\
`git clone https://github.com/gja22/dotfiles.git`

## Bash Configuration
In your home directory run the following commands:

`ln -s gja22/dotfiles/bash_profile .bash_profile`\
`ln -s gja22/dotfiles/bashrc .bashrc`

## Vim Configuration
A little setup for new machines:
```
mkdir ~/.vim
cd ~/.vim
ln -s ~/dotfiles/gja22/vimrc vimrc
mkdir backup
mkdir swp
mkdir undo
mkdir colors
```

### Vim Color Schemes
I like the tender color scheme.

Clone the repo to your preferred location.

`git clone git://github.com/jacoborus/tender.vim.git`

Then copy the color file to the right Vim directory.

`cd tender.vim/colors`\
`cp tender.vim ~/.vim/colors/.`

Now modify vimrc (this is already in my default vimrc file):

```
syntax enable
colorscheme tender
```

There is also a port of the tender color scheme to iTerm2.

`git clone https://github.com/tomwei7/tender-iterm2`

Don't you just love open source!

## Vim Packages



