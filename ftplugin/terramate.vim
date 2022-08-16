function! terramate#FindProjectRoot(buffer) abort
    let l:project_root = ale#path#FindNearestDirectory(a:buffer, '.git')
    return l:project_root
endfunction

call ale#linter#Define('terramate', {
\   'name': 'terramate',
\   'lsp': 'stdio',
\   'executable': 'terramate-ls',
\   'command': 'terramate-ls',
\   'project_root': function('terramate#FindProjectRoot'),
\   'initialization_options': {},
\})
