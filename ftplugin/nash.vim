set shiftwidth=8
set softtabstop=8
set noexpandtab
set nolist


function! s:getlines()
  let buf = getline(1, '$')
  if &encoding != 'utf-8'
    let buf = map(buf, 'iconv(v:val, &encoding, "utf-8")')
  endif
  if &l:fileformat == 'dos'
    " XXX: line2byte() depend on 'fileformat' option.
    " so if fileformat is 'dos', 'buf' must include '\r'.
    let buf = map(buf, 'v:val."\r"')
  endif
  return buf
endfunction

" IsWin returns 1 if current OS is Windows or 0 otherwise
function! s:iswin() abort
  let win = ['win16', 'win32', 'win64', 'win95']
  for w in win
    if (has(w))
      return 1
    endif
  endfor

  return 0
endfunction

function! s:shellerr() abort
  return v:shell_error
endfunction

" fmt_cmd returns a dict that contains the command to execute nashfmt
" args is dict with
function! s:fmt_cmd(bin_name, source, target)
  " TODO: check if binary exists
  " start constructing the command
  let cmd = [a:bin_name]
  call add(cmd, "-w")
  call add(cmd, a:source)
  return cmd
endfunction

" System runs a shell command. It will reset the shell to /bin/sh for Unix-like
" systems if it is executable.
function! s:system(str, ...) abort
  let l:shell = &shell
  if !s:iswin() && executable('/bin/sh')
    let &shell = '/bin/sh'
  endif

  try
    let l:output = call('system', [a:str] + a:000)
    return l:output
  finally
    let &shell = l:shell
  endtry
endfunction

" run runs the nashfmt command for the given source file and returns
" the the output of the executed command. Target is the real file to be
" formated.
function! s:run(bin_name, source, target)
  let cmd = s:fmt_cmd(a:bin_name, a:source, a:target)
  if empty(cmd)
    return
  endif

  let command = join(cmd, " ")
  " execute our command...
  let out = s:system(command)
  return out
endfunction

" Populate populate the location list with the given items
function! s:populate(listtype, items, title) abort
    call setqflist(a:items, 'r')
    if has("patch-7.4.2200") | call setqflist([], 'a', {'title': a:title}) | endif
endfunction

" show_errors opens a location list and shows the given errors. If the given
" errors is empty, it closes the the location list
function! s:show_errors(errors) abort
  let l:listtype = "quickfix"
  if !empty(a:errors)
    call s:populate(l:listtype, a:errors, 'Format')
    echohl Error | echomsg "nashfmt returned error" | echohl None
  endif
endfunction

function! s:format() abort
  " Save cursor position and many other things.
  let l:curw = winsaveview()

  " Write current unsaved buffer to a temp file
  let l:tmpname = tempname()
  call writefile(s:getlines(), l:tmpname)
  if s:iswin()
    let l:tmpname = tr(l:tmpname, '\', '/')
  endif

  let bin_name = g:nash_fmt_command

  let out = s:run(bin_name, l:tmpname, expand('%'))
  if s:shellerr() == 0
    call s:update_file(l:tmpname, expand('%'))
  elseif g:nash_fmt_fail_silently == 0
    let errors = s:parse_errors(expand('%'), out)
    call s:show_errors(errors)
  endif

  " We didn't use the temp file, so clean up
  call delete(l:tmpname)

  " Restore our cursor/windows positions.
  call winrestview(l:curw)
endfunction

" parse_errors parses the given errors and returns a list of parsed errors
function! s:parse_errors(filename, content) abort
  let splitted = split(a:content, '\n')

  " list of errors to be put into location list
  let errors = []
  for line in splitted
    let tokens = matchlist(line, '^\(.\{-}\):\(\d\+\):\(\d\+\)\s*\(.*\)')
    if !empty(tokens)
      call add(errors,{
            \"filename": a:filename,
            \"lnum":     tokens[2],
            \"col":      tokens[3],
            \"text":     tokens[4],
            \ })
    endif
  endfor

  return errors
endfunction

" update_file updates the target file with the given formatted source
function! s:update_file(source, target)
  " remove undo point caused via BufWritePre
  try | silent undojoin | catch | endtry

  let old_fileformat = &fileformat
  if exists("*getfperm")
    " save file permissions
    let original_fperm = getfperm(a:target)
  endif

  call rename(a:source, a:target)

  " restore file permissions
  if exists("*setfperm") && original_fperm != ''
    call setfperm(a:target , original_fperm)
  endif

  " reload buffer to reflect latest changes
  silent! edit!

  let &fileformat = old_fileformat
  let &syntax = &syntax
endfunction

let g:nash_fmt_command = "nashfmt"
let g:nash_fmt_fail_silently = 0

autocmd BufWritePre *.sh call s:format()
