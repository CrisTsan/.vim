"relative numbers toogling
function! NumberToggle()
if(&relativenumber == 1)
	set norelativenumber
else
	set relativenumber
endif
endfunc

function! Trim()
    if search('\s\+$', 'cnw')
        :%s/\s\+$//g
    endif
endfunction

"------[ Magically build interim directories if necessary ]-------------------

function! AskQuit (msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
             \       "&Create it\nor &Quit?", 2)

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
        endtry
    endif
endfunction

augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

