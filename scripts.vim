:let filepath = expand("%:p")
:echo filepath
:let result = system("nashfmt " . filepath)
:if v:shell_error == "0"
    setfiletype nash
:endif
