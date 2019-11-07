# My Vim Setup

To setup vim just run the setup.sh script.

## Requirements
 * git
 * wget
 * Linux system
 * ctags (Optional)

This script will then install all the bundles listed in the vimrc file.

NOTE: If you use vim as your default editor, make sure you update your
alternatives to be something other then vim.tiny (e.g. vim.nox).

You may also want to set git to use vim:
```bash
git config --global core.editor vim
```
## Features
  * Override settings with .vimrc.local
  * Add your own vundles with .vimrc.local.vundles
  * Toggle the nerdtree (filesystem) split with \<CTRL+n\> or \<F2\>
    * Use '?' once in the split to get shortcuts, like 's'
  * Nerdtree also shows git status on files
  * Opens in Nerdtree view by default if no file specified
  * Open a file directly to a line, e.g. vim file:20
  * Solarized colour theme with dark background
  * Tab is 4 spaces by default, override this per language or in .vimrc.local
  * Hack as the default font (in graphical vim like gvim, or macvim)
  * Airline bar at the bottom gives you:
    * Git branch
    * File encoding
    * and more!
  * Toggle a class browser (tagbar) split with \<F9\> (requires ctags to be
installed)
  * Highlights column 80, so you can manage width properly
  * YAML files are treated as Ansible
  * Auto-generate TOC for markdown files with :GenTocGFM
  * Syntastic checks syntax for range of file formats, python, bash, etc
  * Better terminal integration to make it more graphical like, mous click goes
to visual mode, hold down SHIFT for traditional buffer copy and paste with
middle mouse
  * Shows whitespace at end of lines and hard tabs with special chars
  * Shortcuts for switching buffers (bn bp) and tabs (tn, tp) next and previous
  * ctrlp adds fuzzy file searching, activatge with \<CTRL+p\> oddly enough

### Python specific features
  * Show python docs with 'K'
  * Runs through pyflakess and pep8 on save
  * Auto fix pep8 has been mapped to \<F8\>
  * Python auto complete
  * Tracks trailing white spaces
  * Uses vundle to manage vim plugins
  * Fugitive plugin for git
  * Jedi for auto complete
  * If tagbar is setup \<F9\> will open a class browser.

NOTE: Hopefully gg=G and \<F8\> will now be enough to fix indents and at least
the simple pep8 issues in your python code.
