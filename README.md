vim-moode
=========
:musical_score:
Because no one else wrote a Vim plugin for [Moode audio](https://github.com/moode-player/moode).

Control a moode audio player from within your favorite editor.  Basic functions like play, stop,
mute, volume up, and volume down are supported. Run `:help Moode` to see all commands.

## Installation

Install using your favorite plugin manager.  I use [vim-plug](https://github.com/junegunn/vim-plug):
```
call plug#begin(vimplugdir)
  ...
  Plug 'TimSpence/vim-moode'
  ...
call plug#end()
```

## Usage

Start your player by executing `:MoodePlay` to .  If nothing happens, execute `:help Moode` to
debug your configuration.

## Contributing

I wrote this plugin to solve a pretty minor problem:  how to adjust the music on a headless raspberry
pi without interrupting my focus in vim.  It can always be improved, so Fork it and make a pull request
if you have an interesting idea.
