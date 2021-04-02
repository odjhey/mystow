set nocompatible

"FZF
set rtp+=/usr/local/opt/fzf

call plug#begin('~/.local/share/nvim/plugged')
"syntax js
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"syntax typescript
"Plug 'HerringtonDarkholme/yats' "parens in const a = b() freezes nvim ;'(
Plug 'peitalin/vim-jsx-typescript' "syntax highlight
Plug 'leafgarland/typescript-vim'

"syntax gql
"Plug 'jparise/vim-graphql'

"ui
Plug 'gruvbox-community/gruvbox' "Plug 'morhetz/gruvbox'

"keys
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'unblevable/quick-scope'

"git
Plug 'tpope/vim-fugitive'

" - SERVICES - 
" show lint in gutter
" Plug 'w0rp/ale'
" like gitgutter

"Plug 'mhinz/vim-signify' - try gitgutter for quickfix features
Plug 'airblade/vim-gitgutter'

"Plug 'mhartington/nvim-typescript', {'do': './install.sh'} "error, some
"commands missing
" For async completion
" Plug 'Shougo/deoplete.nvim'
" For Denite features
" Plug 'Shougo/denite.nvim'

"formatters
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'SirVer/ultisnips'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'honza/vim-snippets'

"rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

"lisp
Plug 'luochen1990/rainbow'
Plug 'eraserhd/parinfer-rust', {'do':
      \  'cargo build --release'}
Plug 'wlangstroth/vim-racket'

"ui
"Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'junegunn/goyo.vim' "Distraction free
Plug 'junegunn/limelight.vim' "color free
Plug 'junegunn/vim-peekaboo' "visual cue for registers

Plug 'junegunn/seoul256.vim'

Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

"Plug 'leafo/moonscript-vim'

Plug 'mbbill/undotree'

"Markdown needs
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'

Plug 'artanikin/vim-synthwave84'

call plug#end()

set mouse=a

set hidden                    " allow unsaved background buffers and remember marks/undo for them 
set history=10000             " remember more commands and search history
set expandtab 
set tabstop=4
set shiftwidth=2
set softtabstop=4

syntax on
filetype plugin indent on

"set autoindent " follow indent of previous line
set scrolloff=5
set incsearch
set hlsearch
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters
set title " show filename on titlebar

"" unhighlight on Enter
"nnoremap <CR> :nohlsearch<CR> 
" Repeat last macro if in a normal buffer. Thanks @wincent
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
noremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>
" Store relative line number jump in the jumplist if they exceed a threshold
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

nnoremap <Leader>o :only<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>
nnoremap <Leader>q :quit<CR>

" Cycle through relativenumber + number, number (only), and no numbering.
function! Cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!
  endif
endfunction
nnoremap <silent> <Leader>r :call Cycle_numbering()<CR>



" Cycle through relativenumber + number, number (only), and no numbering.
function! Cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!
  endif
endfunction


set report=0    " Report the number of lines changed. (substitute)
set ttyfast
set wildmenu    " Use <tab> when completing a command in cli
set showmatch

" LOL got these from TPOPE - QoL
nnoremap Y  y$
inoremap <C-C> <Esc>`^

" Navigation
" Speed up viewport scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Does not work as i like - weird
" vnoremap     <M-<> <gv
" vnoremap     <M->> >gv
" vnoremap     <Space> I<Space><Esc>gv

" -*- vim -*- vim:set ft=vim et sw=0 sts=2:
" -*- vim -*- vim:set ft=vim et sw=2 sts=2:
inoremap <C-X>^ <C-R>=substitute(&commentstring,' \=%s\>'," -*- ".&ft." -*- vim:set ft=".&ft." ".(&et?"et":"noet")." sw=".&sw." sts=".&sts.':','')<CR>

inoremap <M-0>      <C-O>0
cnoremap <C-O>      <Up>
inoremap <M-o>      <C-O>o
inoremap <M-O>      <C-O>O
inoremap <M-i>      <Left>
inoremap <M-I>      <C-O>^
inoremap <M-A>      <C-O>$
noremap! <C-J>      <Down>
noremap! <C-K><C-K> <Up>

" remove backups forever
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip+=/safe/*
set directory=~/.vim/swaps     " Set directory for swap files.

set showcmd
set noshowmode "don't show mode, cause airline

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1

" reenable: disable for now:  Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" FZF {{{
nnoremap <c-t> :FZF<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <c-f> :Buffer<CR>
nnoremap <c-s> :BLines<CR>
"}}}

"insert new line
map <leader><Enter> o<ESC> 

" Ag instead of Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" min split heights
set winheight=35
:silent! set winminheight=5


" highlight current line, but only in active window #Stolen from anishathalye
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" Workspace Properties {{{
set guioptions=
"set lines=50
"set columns=20
set colorcolumn=80
"Splits
set splitbelow
set splitright
set nu "Ruler (vertical)
"set relativenumber
set norelativenumber
"}}}
" File Type Properties  {{{
set encoding=utf-8 nobomb
set nowrap
set list   
"set listchars=tab:→\ ,eol:¬,extends:>,precedes:<,trail:·,space:.,nbsp:░
set listchars=tab:→\ ,eol:¬,extends:>,precedes:<,trail:·,space:.,nbsp:␣
"set listchars=
"set listchars+=tab:·\ 
"set listchars+=trail:·
"set listchars+=extends:»
"set listchars+=precedes:«
"set listchars+=nbsp:░
" split style
set fillchars=vert:▒
"Text Display
"if has("gui_macvim")
"  set guifont=Menlo
"elseif has("gui_running")
"  set guifont=Consolas:h10
"endif

set termguicolors

if has('gui_running')
  colorscheme solarized
  "I dont like the default Solarized background
  hi Normal guibg=#1c1c1c
  hi Normal guifg=#c9c9c9
  hi LineNr guibg=#1a1a1a
  hi LineNr guifg=#c9c9c9
else
  "colorscheme pablo
  "colorscheme badwolf
  let g:gruvbox_contrast_dark = "hard"
  let g:gruvbox_contrast_soft = "hard"
  colorscheme gruvbox

  " Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240

  "colorscheme sift
  "colorscheme base
  "colorscheme luna-term
  "colorscheme spaceduck
  "let g:airline_theme = 'spaceduck'

endif

"always show filename above status bar
set laststatus=2
"}}}
" Bind Wanted Keys {{{
"remaps
let maplocalleader = "\\"
let mapleader = " "
"inoremap <c-s> <Esc>:w<CR>
"noremap <Tab> %
"imap <S-Space> <Esc>

"this bind is for folding using space
"nnoremap <Space> za    
nnoremap <leader><CR> <C-^>

"}}}
" Unbind Sh**y keys {{{
" I no longer need to unbind the arrow keys as im no longer using it
"for prefix in ['i', 'n', 'v']
"  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"    exe prefix . 'noremap ' . key . ' <Nop>'
"  endfor
"endfor
"}}}

" Folding {{{
set foldmethod=marker
"set foldcolumn=2
function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat("…",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
"}}}

"" Uncategorized {{{
"" Save when losing focus
"au FocusLost * :silent! wall
""}}}
" Line Return {{{
" Make sure Vim returns to the same line when you reopen a file. check
" vimhelp see last-position-jump
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Hacks/fixes {{{
" For non-cygwin
":set timeout timeoutlen=1000 ttimeoutlen=100
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
set nostartofline
" }}}
" Custom Funcs {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
  let typo = {}
  let typo["“"] = '"'
  let typo["”"] = '"'
  let typo["‘"] = "'"
  let typo["’"] = "'"
  let typo["–"] = '--'
  let typo["—"] = '---'
  let typo["…"] = '...'
  :exe ":%s/".join(keys(typo),'\|').'/\=typo[submatch(0)]/ge'
endfunction
"don't need this for now
"command! RemoveFancyCharacters :call RemoveFancyCharacters()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
" inoremap <expr> <tab> InsertTabWrapper()
" inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>
"}}}
"add split line
"CTags
"Plugin settings
"Text Objects
"Ack motions
"Error toggles
"Utils
"Hg
"Environments (GUI/Console)
"Nyan!

" vim:foldmethod=marker:foldlevel=0

" 09232015 --- New Stuff --- Cygwin Block Cursor On Visual Mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

silent! dig -. 8230  "U+2026=…  HORIZONTAL ELLIPSIS (CTRL+K in I mode)
silent! dig PR 9654

" Map the conceal characters to their expanded forms.
"inoremap <silent> @ <C-r>=syntax_expand#expand("@", "this")<CR>
"inoremap <silent> # <C-r>=syntax_expand#expand("#", "prototype")<CR>
"inoremap <silent> < <C-r>=syntax_expand#expand_head("<", "return")<CR>

set conceallevel=0
" Keeps everything concealed at all times. Even when my cursor is on the word.
set concealcursor=nvic

"" JavaScript thanks to pangloss/vim-javascript
"let g:javascript_conceal_function   = "λ"
"let g:javascript_conceal_null       = "ø"
""let g:javascript_conceal_this       = "@"
""let g:javascript_conceal_return     = ">"
""let g:javascript_conceal_undefined  = "¿"
""let g:javascript_conceal_NaN        = "ℕ"
"let g:javascript_conceal_prototype  = "¶"
"let g:javascript_conceal_static     = "•"
"let g:javascript_conceal_super      = "Ω"

" For some reason, vim-javascript conceal does not work on cygwin ... weird
" See below for some quickfix.
" ### vim-javascript/syntax/javascript.vim clashes with the default config,
" ### to get around the situation, I have moved the foollowing files to...:
" ### mv ftplugin/javascript.vim      ftplugin/javascript.vim.old
" ### mv syntax/javascript.vim        syntax/javascript.vim.old
"syntax keyword function function conceal cchar=λ
"syntax keyword vartest var conceal cchar=#


"let g:scroll_position_auto_enable=0
let g:scroll_position_marker = '⇒' 
"hi SignColumn           ctermbg=232 
hi ScrollPositionMarker ctermfg=208 ctermbg=237 
highlight Pmenu ctermbg=235 guibg=gray
"hi ScrollPositionMarker guibg=#1a1a1a guifg=#c9c9c9

let g:CommandTFileScanner="git"

"let g:syntastic_javascript_checkers = ['eslint']


" "Powerline is deprecated, use lightline
" "let g:Powerline_symbols = 'fancy'
" "let g:Powerline_colorscheme = 'solarized256'
" let g:lightline = {
"             \ 'colorscheme': 'gruvbox',
"             \ '': {
"             \   'left': [['mode', 'paste'], 
"             \            ['readonly', 'filename', 'modified']]
"             \ },
"             \ }


" october 2017
cnoremap %% <C-R>=expand('%:h').'/'<cr>

let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:indentLine_char = '┆'

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"

"" Notes.vim {{{
"augroup notes_config
"  autocmd!
"  let g:notes_directories = ['~/Dropbox/Notes']
"augroup END
"" }}}

" Match it
packadd! matchit

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsEditSplit="vertical"

let g:deoplete#enable_at_startup = 1

"ALE
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint']
      \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1



" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style' : 'minimal'
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

" Easymotion
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"do :h easymotion you dummy
"let g:EasyMotion_smartcase = 1

let g:python3_host_prog='/usr/local/opt/python/libexec/bin/python'

let g:airline_powerline_fonts = 1

" Does not work in NeoVim
" https://github.com/powerline/powerline/issues/1287
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup


" Rust
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)


nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

if &diff
  colorscheme gruvbox
  set signcolumn=
  "set nolist
  set diffexpr=""
  set diffopt+=iwhiteall
  set diffopt+=icase
endif


"hi SpecialKey cterm=NONE ctermfg=darkgray ctermbg=NONE
"hi NonText ctermfg=NONE
"hi Visual term=reverse cterm=reverse guibg=Grey
hi Visual cterm=NONE ctermbg=241 ctermfg=NONE guibg=Grey40

hi DiffAdd    cterm=NONE ctermbg=23  ctermfg=NONE   guibg=Grey40
hi DiffDelete cterm=NONE ctermbg=52   ctermfg=NONE guibg=Grey40

hi DiffChange cterm=NONE ctermbg=53 ctermfg=NONE guibg=Grey40
hi DiffText   cterm=NONE ctermbg=58 ctermfg=NONE guibg=Grey40

"hi VertSplit ctermfg=darkgray ctermbg=NONE
"
"hi ALEError cterm=underline ctermfg=red
"hi ALEErrorSign cterm=underline ctermfg=red
"hi ALEWarning cterm=underline ctermfg=yellow
"hi ALEWarningSign cterm=underline ctermfg=yellow






"let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

augroup Racer
  autocmd!
  autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
  autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
  autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
  autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
  autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

"augroup javascript_folding
"    au!
"    au FileType javascript setlocal autoindent=off
"    au FileType javascript setlocal foldmethod=syntax
"augroup END

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" I don't change theme often so no need to add in augroup gruvbox
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=205 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

au BufRead,BufNewFile *.fnl setfiletype lisp

let g:rainbow_active = 1
let g:rainbow_conf = { 
      \ 'ctermfgs': ['white', 'red', 'darkcyan', 'lightred', 'lightblue', 
      \              'lightmagenta', 'lightgreen', 'lightyellow', 'lightcyan'] 
      \}
