:let filepath = expand("%:p")
:echo filepath
:let result = system("nashfmt " . filepath)
:echo result
setfiletype nash
