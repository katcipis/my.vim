<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Introduction](#introduction)
- [Navigation](#navigation)
- [Project wide substitution](#project-wide-substitution)
- [Execute Ex command on a pattern](#execute-ex-command-on-a-pattern)
- [Registers](#registers)
- [Macros](#macros)
- [Autocomplete](#autocomplete)
- [Spell Checker](#spell-checker)
- [Perform action inside a text object](#perform-action-inside-a-text-object)
- [Perform action until a char is found](#perform-action-until-a-char-is-found)
- [FTPlugin](#ftplugin)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Introduction

My vimrc configuration, plugins and some other vim useful stuff
(mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).


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
On **INSERT** mode just run: <code>[C-v]TAB</code>.

This can be used to force any special character.

# FTPlugin

It is an awesome way to have different ways to configure vim according to the file type.

Check [here](http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean) for more details.
