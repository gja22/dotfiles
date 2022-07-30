# dotfiles

My collection of configuration files.

## Installation

Clone the repo to your desired location. I keep it in `~/gja22/dotfiles`.

`mkdir ~/gja22`\
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
ln -s ~/gja22/dotfiles/vimrc vimrc
mkdir backup
mkdir colors
mkdir pack/plugins/start
mkdir swp
mkdir undo
```

### Vim Color Schemes

I use the following folder as a holding area for color themes:

`mkdir ~/gja22/vim-color-schemes`

Into which I clone color schemes (gruvbox is my current favorite):

`cd ~/gja22/vim-color-schemes`\
`git clone https://github.com/gruvbox-community/gruvbox.git`

And then copy the color theme to the Vim config directory:

`cd ~/gja22/vim-color-schemes/gruvbox`\
`cp gruvbox.vim ~/.vim/colors/.`

Now modify vimrc (this is already in my default vimrc file):

```
syntax enable
colorscheme gruvbox
```

### Vim Packages

Since Vim8 I have not used a package manager for Vim. I prefer to just clone
packages directly from GitHub. Here is an example:

`cd ~/.vim/pack/plugins/start`\
`git clone https://github.com/tpope/vim-commentary.git`

You can read about the plugins I like
[here](https://www.gja22.com/vim-plugins). 

## tmux

tmux configuration can live in `~/.tmux.conf` or `~/.config/tmux/tmux.conf`. I
prefer the later as it keeps all the config a little cleaner.

`mkdir ~/.config/tmux`\
`cd ~/.config/tmux`\
`ln -s ~/gja22/dotfiles/tmux.conf tmux.conf`

## License

Dotfiles is released under the [MIT License](https://opensource.org/licenses/MIT).
