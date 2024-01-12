# vim-mi

[vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) plugin for MI assembly

<!--![vim-mi-example](#)-->

## Introduction

This is a vim plugin that adds support for [MI](https://github.com/ucsrl/mi-simulator) assembly. MI (German: Maschine für die Ausbildung) is a
[SoC](https://en.wikipedia.org/wiki/System_on_a_chip) with its own [ISA](https://en.wikipedia.org/wiki/Instruction_set_architecture) created in the mid 80s in Munich. The ISA is a derivative of [VAX](https://en.wikipedia.org/wiki/VAX). 
MI is primarily used for teaching.

## How it works

Files with extensions `*.mi`, `*.miasm`, `*.asm.mi` are [automatically](https://github.com/ucsrl/vim-mi/blob/master/ftdetect/mi.vim) 
[syntax highlighted](https://github.com/ucsrl/vim-mi/blob/master/syntax/mi.vim) in vim.

## Installation

1. Download or clone the repository 
2. Set the `runtimepath` in your `.vimrc`:
`set runtimepath^=/path/to/vim-mi`

Alternatively, you can use any plugin manager (e.g. [vim-plug](https://github.com/junegunn/vim-plug) or [Vundle](https://github.com/VundleVim/Vundle.vim)).

## License
[Public Domain](https://github.com/ucsrl/vim-mi/blob/main/UNLICENSE)
