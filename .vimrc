echo "vimrc file in C:\\Users\\Jeff" 

" Use Pathogen plugin
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
" :call pathogen#helptags() to generate all helptags

"Vim sessions default to capturing all global options, which includes the 'runtimepath' that pathogen.vim manipulates. This can cause other problems too, so I recommend turning that behavior off:
set sessionoptions-=options

"source $VIMRUNTIME/macros/matchit.vim

" Load ctags
"set tags=tags,~/ProcessConfigChecker/tags
"set tags=./tags,tags;$HOME
source ~/cscope_maps.vim

"This option stops vim from behaving in a strongly vi -compatible way. It should be at the start of any vimrc file as it can affect lots of other options which you may want to override.
set nocompatible

"By default, searching starts after you enter the string. With the option: ":set incsearch" set, incremental searches will be done. The Vim editor will start searching when you type the first character of the search string. As you type in more characters, the search is refined.
set incsearch

"The "highlight search option" ('hlsearch') turns on search highlighting. This option is enabled by the command: ":set hlsearch" After the option is enabled, any search highlights the string matched by the search.
set hlsearch

"searching is not case sensitive
set ignorecase

"Under default settings, making changes and then opening a new file will display E37: No write since last change (add ! to override)
"Typing :set hidden will change this behaviour
"With :set hidden, opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
"The unsaved changes can still be accessed by typing :ls and then :b[N], where [N] is the number of a buffer -- I wrote more about buffers in Vim 101: Buffers
set hidden

" show the editing mode on the last line
set showmode

"If 'ignorecase' is on, you may also want: ":set smartcase" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only "The", while /the would find "the" or "The" etc. The 'smartcase' option only applies to search patterns that you type; it does not apply to * or # or gd. If you press * to search for a word, you can make 'smartcase' apply by pressing / then up arrow then Enter (to repeat the search from history).
set smartcase

"The Vi editor has a 'autoindent' option which indents each line the same the previous one.
set autoindent

"When enabled, the ruler is displayed on the right side of the status line at the bottom of the window. By default, it displays the line number, the column number, the virtual column number, and the relative position of the cursor in the file (as a percentage).
"This makes vim show the current row and column at the bottom right of the screen. (if status line isn't enabled?)
"set ruler

" enable status line
set laststatus=2

" Emulate standard status line with 'ruler' set
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
" changes background
set statusline+=%#PmenuSel#
" grabs git branch of file
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
" filename
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
" changes background
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
" percentage in file
set statusline+=\ %p%%
" line and column in file
set statusline+=\ %l:%c
set statusline+=\ 

set number  " show line numbers

"'smartindent' automatically inserts one extra level of indentation in some cases, and works for C-like files.
set smartindent

" size of a hard tabstop "set tabstop=4"
" a combination of spaces and tabs are used to simulate tab stops at a width other than the (hard)tabstop "set softtabstop=4"
" size of an "indent" "set shiftwidth=4"
"'expandtab' always uses spaces instead of tab characters
set ts=2 sts=2 sw=2 expandtab

" Word wrapping; most already default it on but some don't
set wrap

" word wrapping on vim diffs
"autocmd FilterWritePre * if &diff | setlocal wrap< | endif

"Shows tabs (^l) and end of line ($)
set list  " show hidden characters

set listchars=tab:>-,trail:-,eol:�

"set lines=60 columns=120

"set guifont=Monospace\ 8

"To give more space for displaying messages, you can increase the height of the command line to 2 or greater
set cmdheight=2

set guioptions-=T " no toolbar

" keep more context when scrolling off the end of a buffer
"The 'scrolloff' (scroll offset) option determines the minimum number of screen lines that you would like above and below the cursor.
set scrolloff=3

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

" Enable highlighting for syntax
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

set cursorline

if v:version > 700
    "Simply putting :set cursorline in your vimrc will highlight the current line in every window and update the highlight as the cursor moves.
    hi CursorLine guibg=grey5
endif

set backupdir=~\temp,~\tmp,.
set dir=~\temp,~\tmp,.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert
"colorscheme molokai
hi Normal guifg=White guibg=Black
hi LineNr guifg=White guibg=Black
hi NonText guifg=Blue guibg=Black
hi SpecialKey guifg=grey20 guibg=grey10
"hi Search guibg=#5577ee

"nnoremap <f5> :colorscheme oceandeep<cr>
"nnoremap <f6> :colorscheme molokai<cr>

"This tells vim to use colors which look good on a dark background.
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vim provides a facility to define additional mappings on these keys. It's called a mapleader, and it's easy to setup. First you need to define what key you want your mapleader to be. I prefer comma because it's (in my daily usage) unused, and it's easy to reach.
let mapleader=","

"nmap, nnoremap, nunmap          Normal mode
"default/remap is recursive; noremap is non-recursive

nmap <Leader>v :e ~/.vimrc<CR>
nmap <Leader>s :source ~/.vimrc<CR>

nmap <Leader>bs :e ~/.bash_aliases<CR>
nmap <Leader>bf :e ~/.bash_functions<CR>

" easier esc
imap jk <esc>

" switch between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Bubble line up/down
nnoremap <a-up> ddkP
nnoremap <a-down> ddp

" Switch between buffers
nnoremap <silent> <leader>6 <c-^>
nnoremap <silent> <c-tab> :bn<cr>
nnoremap <silent> <c-s-tab> :bp<cr>

" Find first instance in the file (forward search)
nnoremap <f3> ggnzz

" Select All
nnoremap <Leader>a ggVG

" Move within wrapped lines
nnoremap j gj
nnoremap k gk

" Keep selection after indent
vnoremap < <gv
vnoremap > >gv

" Resize the window
nnoremap - 10<c-w>-
nnoremap + 10<c-w>+

" Fold the function by first finding outermost open curly brace, then center around cursor
nnoremap <leader>ff 20[{zf%zz

" Horizontal rule
nnoremap <leader>l o================================================================================<cr><esc>
inoremap <leader>l ================================================================================

" Insert date at front
nnoremap <f2> I<c-r>=strftime("%m/%d/%y")<cr> <esc>
inoremap <f2> <c-r>=strftime("%m/%d/%y")<cr> 

" Insert common buffers
inoremap <c-]> <c-r>"
inoremap <c-\> <c-r>*

" Use normal regex
nnoremap / /\v

" Change to directory of current file
nnoremap <silent> <leader>pwd :cd %:h<cr>:pwd<cr>

" NERDTree
nnoremap <leader>nt :NERDTree<cr>
nnoremap <f9> :NERDTreeToggle<cr>

" Tagbar
nnoremap <silent> <F12> :TagbarToggle<CR>

" Save session
nnoremap <leader>mks :mksession! ~/.vimsession.vim<cr>
nnoremap <leader>res :source ~/.vimsession.vim<cr>


"function! CleverTab()
"  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"    return "\<Tab>"
"  else
"    return "\<C-N>"
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>


"function! CleverTab()
"  if pumvisible()
"    return "\<C-N>"
"  endif
"  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"    return "\<Tab>"
"  elseif exists('&omnifunc') && &omnifunc != ''
"    return "\<C-X>\<C-O>"
"  else
"    return "\<C-N>"
"  endif
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>
"
"

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
ca shell Shell

"command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)
command! -complete=file -nargs=* Hg  call s:RunShellCommand('hg '.<q-args>)
