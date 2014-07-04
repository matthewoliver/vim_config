=== My Vim Setup ===

To setup vim just run the setup.sh script.

=== Requirements ===
  - git
  - wget
  - Linux system

This script will then install all the bundles listed in the vimrc file.

NOTE: If you use vim as your default editor, make sure you update your alternatives to be something other then vim.tiny. 
(i.e. vim.nox)

=== Features ===

  - Toggle the nerdtree (filesystem) split with <f2>
    - Use '?' once in the split to get shortcuts, like 's'

  - Show python docs with 'K'.
  - runs through pyflakess and pep8 on save.
  - Python auto complete.
  - Tracks trailing white spaces.
  - Highlights column 80, so you can manage width properly.
  - Dark background
  - Tab is 2 spaces.
  - Uses vundle to manage vim plugins.
  - Fugitive plugin for git.
  - Jedi for auto complete.
  - Is suppose to setup a better status bar but requires extra fonts.
    - but still works with out them just not as nice.
    - gives you:
      - Git branch
      - File encoding
      - etc.
