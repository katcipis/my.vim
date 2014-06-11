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


#Text objects

##Performing actions inside text objects

Pattern: <code>[action]i[delimiter]</code>

The *delimiter* is what defines where the text object start and where it ends.

The idea is that you are performing an *action* inside (helps remembering the *i* :-) the text object that is defined by the *delimiter* .

Examples:

* Start change inside braces: <code>ci{</code>
* Delete the contents of a string: <code>di"</code>
* Yanking everything inside parentheses: <code>yi(</code>


##Performing actions until a text object is found

Pattern: <code>[action]t[char]</code>

Examples:

* Delete everything until a *{* is found and start editing: <code>ct{</code>
* Delete everything until a *(* is found: <code>dt(</code>
* Yanking everything until a *)* is found: <code>yt)</code>
