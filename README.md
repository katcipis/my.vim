#Introduction

My vimrc configuration, plugins and some other vim useful stuff (mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).


#Text objects

##Performing actions inside text objects

Pattern: *(action)* i *(delimiter)*

The *delimiter* is what defines where the text object start and where it ends.

The idea is that you are performing an *action* inside (helps remembering the *i* :-) the text object that is defined by the *delimiter* .

Examples:

* Start change inside braces: <code>ci{</code>
* Delete the contents of a string: <code>di"</code>
* Yanking everything inside parentheses: <code>yi(</code>
