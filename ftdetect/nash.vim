:let fileextension = expand("%:e")

:if fileextension == "sh"
    :let filepath = expand("%:p")
    :let result = system("nashfmt " . filepath)
    :if v:shell_error == "0"
        au BufRead,BufNewFile *.sh		set filetype=nash
        au BufRead,BufNewFile *.sh		set syntax=sh
    :endif
:endif
