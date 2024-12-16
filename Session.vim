let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 lua/polish.lua
badd +1 lua/community.lua
badd +1 lua/plugins/none-ls.lua
badd +1 lua/plugins/astrolsp.lua
badd +1 lua/plugins/astrocore.lua
badd +1 lua/plugins/astroui.lua
badd +21 lua/plugins/heirline.lua
badd +268 ~/.local/share/nvim/lazy/astroui/lua/astroui/status/component.lua
badd +1 ~/.local/share/nvim/lazy/astroui/lua/astroui/status.lua
badd +1 ~/.local/share/nvim/lazy/astroui/lua/astroui/status/utils.lua
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lua/plugins/heirline.lua
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
9,10fold
23,25fold
22,28fold
32,33fold
31,36fold
41,43fold
40,46fold
7,51fold
5,52fold
3,53fold
let &fdl = &fdl
let s:l = 25 - ((17 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 25
normal! 024|
tabnext
edit lua/plugins/heirline.lua
argglobal
balt ~/.local/share/nvim/lazy/astroui/lua/astroui/status/component.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
9,10fold
23,25fold
22,28fold
32,33fold
31,36fold
41,43fold
40,46fold
7,51fold
5,52fold
3,53fold
let &fdl = &fdl
let s:l = 21 - ((20 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 21
normal! 036|
tabnext 2
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
