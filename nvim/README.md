# Notes for using NVChat and NeoVIM

## Goals

* understand efficient ways of working - editing files, running tests, deploying changes.
* would be nice to have some automation around Ci/Cd for a project
* finger muscle memory exercises
* integrate extras: chatGPT
* note taking app

## SSO Work integration

* configure gcloud auth
* configure web session auth 
* make re-auth a background task, taking care of refresh token automatically

## NeoVIM

Get Help: 

* cut-paste
* finding files
* don't leave NeoVIM

## Tmux

Get Help: C-b ?

Get used to creating new windows and panes, C-b c, C-b %, C-b "
Moving between panes C-hjkl
Move panes around, 
Make a new window from a pane C-b !
Zooming in and out, C-b z
Resize panes

Switching between tmux windows Alt-Shift N or M.

## Zsh

Fix my dotfiles setup
Fix the prompt to include the previous directory in the name.
Fix the prompt

## Developer tools

### NeoVIM

* open a terminal


### treesitter, for syntax highlighting

```
TSInstall <item>
TSInstallInfo
```

* NVTree (file tree)

```
C-n         - toggle nvtree

a - add new file
m - mark file
r - rename currently selected
c - copy, with p
```
* find files menu

```
Spc <wait>  - suggestions
Spc f f     - find files
Spc f b     - find buffers
Spc c h     - cheetsheet help
```

## Themes

falcon 

```
Spc t h
```
