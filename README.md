#Introduction

My vimrc configuration, plugins and some other vim useful stuff (mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).


#Navigation

* Centralize on cursor: <code>zz</code>
* Forward word navigation at word start: <code>w</code>
* Forward word navigation at word end: <code>e</code>
* Backward word navigation at word start: <code>b</code>
* Backward word navigation at word end: <code>ge</code>
* Mark line: <code>m[register]</code>
* Goto marked line : <code>'[register]</code>
* Goto file under cursor : <code> gf </code>


# Project wide substitution

* vim -o [files list or regex]
* set hidden
* argdo s,[old-text],[new-text],ge
* argdo update

It is a good idea to put <code> set hidden </code> on your *.vimrc*.


# Execute Ex command on a pattern

Executing a command only on lines that matches a pattern:

<code>
    [range]g/[pattern]/[ex command]
</code>

Example, deleting all lines (entire file, using *%*) that contains *"vim"* on it:

<code>
    %g/vim/d
</code>


# Registers

* Listing registers: <code> :reg </code>
* Executing command with specified register: <code> "[reg][command] </code>

Examples:

* Pasting from yank register (0): <code> "0P </code>
* Yanking to the system clipboard register (+): <code> "+y </code>


# Macros

* Start recording macro : <code> q[register] </code>
* Stop recording macro : <code> q </code>
* Execute macro: <code> @[register] </code>
* Execute macro on parallel: <code>:[range]normal @[register] </code>


# Autocomplete

* Start: <code> [C-n] </code>
* Accept: <code> [C-y] </code>
* Exit: <code> [C-e] </code>
* Omni Complete: <code> [C-x][C-o] </code>


# Spell Checker

* Enable: <code> set spell </code>
* Disable: <code> set nospell </code>
* Next: <code> ]s </code>
* Previous: <code> [s </code>
* Correct word under cursor: <code> z= </code>
* Add word to dict: <code> zg </code>
* Remove word from dict: <code> zw </code>


#Perform action inside a text object

Pattern: <code>[action]i[delimiter]</code>

The *delimiter* is what defines where the text object start and where it ends.

The idea is that you are performing an *action* inside (just remember that *i* means *inside*) the text object that is enclosed by the *delimiter*.

Examples:

* Start change inside braces: <code>ci{</code>
* Delete the contents of a string: <code>di"</code>
* Yanking everything inside parentheses: <code>yi(</code>


#Perform action until a char is found

Pattern: <code>[action]t[char]</code>

Examples:

* Delete everything until a *{* is found and start editing: <code>ct{</code>
* Delete everything until a *(* is found: <code>dt(</code>
* Yanking everything until a *)* is found: <code>yt)</code>
