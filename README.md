#Introduction

My vimrc configuration, plugins and some other vim useful stuff (mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).


#Text objects

##Performing actions inside text objects

Pattern: *action*i*delimiter*

The *delimiter* is what defines where the text object start and where it ends.

Examples:

* Start change inside braces: *ci{*
* Delete the contents of a string: *di"*
* Yanking everything inside parentheses: *yi(*
