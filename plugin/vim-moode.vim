" File          : vim-moode.vim
" Description   : Control moOde audio from inside Vim.
" Author        : Tim Spence
" Created       : 19/09/2020
" License       : :shrug:
" Version       : 0.1

if exists("b:loaded_moode_plugin") || &cp
    finish
endif
let b:loaded_moode_plugin = 1

scriptencoding utf-8

" -------------
" Configuration
" -------------
" Use sensible defaults settings for moOde localhost

" URL scheme (http or https)
if !exists('g:moode_scheme')
    let g:moode_scheme = 'http'
endif

" IP address or hostname of moode player
if !exists('g:moode_host')
    let g:moode_host = '127.0.0.1'
endif

" HTTP port for moode player
if !exists('g:moode_port')
    let g:moode_port = 80
endif

" The number of clicks to raise or lower volume.
" Volume scale: [0,100]
if !exists('g:moode_volume_step')
    let g:moode_volume_step = 5
endif

" --------
" Commands
" --------
command! -nargs=0 -bar Moode call s:moode()
command! -nargs=0 -bar MoodeMute call s:moode_mute()
command! -nargs=0 -bar MoodePlay call s:moode_play()
command! -nargs=0 -bar MoodeStop call s:moode_stop()
command! -nargs=? -bar MoodeUp call s:moode_up(<f-args>)
command! -nargs=? -bar MoodeDown call s:moode_down(<f-args>)

" ---------
" Functions
" ---------
function! s:moode()
    return s:moode_api_call("/command/?cmd=vol.sh")
endfunction

function! s:moode_mute()
    return s:moode_api_call("/command/?cmd=vol.sh mute")
endfunction

function s:moode_play()
    return s:moode_api_call("/command/?cmd=play")
endfunction

function s:moode_stop()
    return s:moode_api_call("/command/?cmd=stop")
endfunction

function s:moode_up(ticks=g:moode_volume_step)
    return s:moode_api_call("/command/?cmd=vol.sh up " . a:ticks)
endfunction

function s:moode_down(ticks=g:moode_volume_step)
    return s:moode_api_call("/command/?cmd=vol.sh dn " . a:ticks)
endfunction

function! s:moode_api_call(path)
    let url = s:moode_url(a:path)
    execute "silent ! curl --silent --location '" . url . "'" | redraw!
    echomsg url
endfunction

function! s:moode_url(path)
    let url = g:moode_scheme . '://' . g:moode_host
    if g:moode_port != 80
        let url = url . ':' . g:moode_port
    endif
    let url = url . a:path
    return url
endfunction
