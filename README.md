<!-- mdtocstart -->

# Table of Contents

- [Introduction](#introduction)
- [Install](#install)
- [Project wide substitution](#project-wide-substitution)
- [Macros](#macros)
- [Perform action inside a text object](#perform-action-inside-a-text-object)
- [Perform action until a char is found](#perform-action-until-a-char-is-found)
- [Forcing a tab](#forcing-a-tab)
- [FTPlugin](#ftplugin)

<!-- mdtocend -->

# Introduction

My neovim configuration, plugins and some other vim useful stuff
(mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).


# Install

You need to installl npm (some language server needs it).

Just run:

```
just
```

And it will install all plugins and configs. It will overwrite the current
configs and plugins.


# Project wide substitution

* vim -o [files list or regex]
* argdo %s,[old-text],[new-text],ge
* argdo update


# Macros

* Start recording macro : <code> q[register] </code>
* Stop recording macro : <code> q </code>
* Execute macro: <code> @[register] </code>
* Execute macro on parallel: <code>:[range]normal @[register] </code>


# Perform action inside a text object

Pattern: <code>[action]i[delimiter]</code>

The *delimiter* is what defines where the text object start and where it ends.

The idea is that you are performing an *action* inside
(just remember that *i* means *inside*) the text object that
is enclosed by the *delimiter*.

Examples:

* Start change inside braces: <code>ci{</code>
* Delete the contents of a string: <code>di"</code>
* Yanking everything inside parentheses: <code>yi(</code>


# Perform action until a char is found

Pattern: <code>[action]t[char]</code>

Examples:

* Delete everything until a *{* is found and start editing: <code>ct{</code>
* Delete everything until a *(* is found: <code>dt(</code>
* Yanking everything until a *)* is found: <code>yt)</code>


# Forcing a tab

When tabs are being replaced by spaces it can be hard to force a tab.
On **INSERT** mode just use: <code>[C-v]TAB</code>.

This can be used to force any special character.

# FTPlugin

It is an awesome way to have different ways to configure vim according to the file type.

Check [here](http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean) for more details.
