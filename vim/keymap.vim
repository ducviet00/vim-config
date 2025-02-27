"
" I don't use recording, don't judge me
map q <Nop>
inoremap jk <ESC>
vnoremap <M-/> <Esc>/\%V
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
" nnoremap L l
" nnoremap H h
" nnoremap l w
" nnoremap h b

vnoremap p "_dP

" Map Emacs like movement in Insert mode
" inoremap <C-n> <Down>
" inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" Remap scrolling
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

map mm <Plug>NERDCommenterToggle

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Key binding
nnoremap <Leader>l :vsplit<CR>
nnoremap <Leader>k :split<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>w= :wincmd =<CR>
nnoremap <Leader>wb :e#<CR>
nnoremap <Leader>qq :bd<CR>
nnoremap <Leader>qk :call DeleteCurrentFileAndBuffer()<CR>
nnoremap <Leader>ss :mksession! .vimsession<CR>
nnoremap <Leader>sr :so .vimsession<CR>
nnoremap <Leader><Leader>r :so ~/.config/nvim/init.vim<CR>

"Buffer
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tc :tabe<CR>
nnoremap <Leader>tx :tabclose<CR>

nnoremap <silent> <Leader>pf :Files<CR>
nnoremap <silent> <Leader>pt :Buffers<CR>
nnoremap <silent> <Leader>pb :Buffers<CR>
nnoremap <silent> <Leader>pr :History<CR>
" nnoremap <silent> <c-\> :call esearch#init()<CR>

" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" nnoremap <silent> \ :Rg<CR>
" nnoremap <silent> <c-o> :CocList outline<CR>

" These are all terminal shorthands
" I've made them to recognize common typos
cnoreabbrev wq w<bar>bd
cnoreabbrev Wq w<bar>bd
cnoreabbrev WQ w<bar>bd
cnoreabbrev wqa1 wqa!
cnoreabbrev qa1 qa!
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev B buffer

" Telescope
" Fuzzy file finder
nnoremap <silent><leader>ff :Telescope find_files hidden=true<CR>
" Fuzzy buffer finder
nnoremap <silent><leader>fb :Telescope buffers<CR>
" Fuzzy help-tages finder
nnoremap <silent><leader>fh :Telescope help_tags<CR>
" Search with ripgrep
nnoremap <silent><leader>fi :Telescope live_grep<CR>
" Fuzzy git status
nnoremap <silent><leader>fg :Telescope git_status<CR>
" Fuzzy old-files finder
nnoremap <silent><leader>fo :Telescope oldfiles<CR>
" Fuzzy command finder
nnoremap <silent><leader>fc :Telescope commands<CR>
" Fuzzy current file word finder
nnoremap <silent><leader>fz :Telescope current_buffer_fuzzy_find<CR>
" Fuzzy workspace symbols
nnoremap <silent><leader>fs :Telescope lsp_workspace_symbols<CR>
" Search projects (projects.nvim)
nnoremap <silent><leader>fp :Telescope projects<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

nnoremap <silent> gb :BufferLinePick<CR>
nnoremap <silent> cb :BufferLinePickClose<CR>

noremap <leader>md :Glow<CR>

nnoremap <silent> <leader>tt :TroubleToggle<CR>

nnoremap <silent><leader>n :call ToggleNvimTree()<CR>
nnoremap <silent><leader>r :NvimTreeRefresh<CR>
nnoremap <silent><leader>f :NvimTreeFindFile<CR>
" Make buffer narrower
nnoremap <silent> <C-H> :vertical resize -4<CR>
" Make buffer wider
nnoremap <silent> <C-L> :vertical resize +4><CR>
" Make buffer shorter
nnoremap <silent> <C-J> :resize -4<CR>
" Make buffer longer
nnoremap <silent> <C-K> :resize +4<CR>

" Escape in terminal mode takes you to normal mode
tnoremap <silent><leader><Esc> <C-\><C-n>
"Similar mappings for terminal mode{{{
tnoremap <silent> <C-H> :vertical resize -4<CR>
tnoremap <silent> <C-L> :vertical resize +4><CR>
tnoremap <silent> <C-J> :resize -4<CR>
tnoremap <silent> <C-K> :resize +4<CR>

function! DeleteCurrentFileAndBuffer()
  call delete(expand('%'))
  bdelete!
endfunction

" Create/Toggle a terminal to the bottom
nnoremap <silent><leader>at :call ChooseTerm("term-slider", 1)<CR>

" Terminal Toggle
function! ChooseTerm(termname, slider)
  let pane = bufwinnr(a:termname)
  let buf = bufexists(a:termname)
  if pane > 0
    " pane is visible
    if a:slider > 0
      :exe pane . "wincmd c"
    else
      :exe "e #"
    endif
  elseif buf > 0
    " buffer is not in pane
    if a:slider
      :exe "botright split"
    endif
    :exe "buffer " . a:termname
  else
    " buffer is not loaded, create
    if a:slider
      :exe "botright split"
    endif
    :terminal
    :exe "f " a:termname
  endif
endfunction

function! ToggleNvimTree()
  if exists(":NvimTreeToggle") == 0
    " lazy load nvim-tree
    silent! packadd nvim-tree.lua
  endif

  NvimTreeToggle
endfunction

command LoadPacker lua require 'plugins-list'
