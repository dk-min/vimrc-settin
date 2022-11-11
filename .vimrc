if has("syntax")
	syntax on
endif
set number
set autoindent
set cindent
set smartindent
set bs=2
set tabstop=4
set expandtab
set shiftwidth=4

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'preservim/nerdcommenter'
"call vundle#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
"Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdentto/YCM-Generator'
Plugin 'puremouning/vimspector'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==========================================
" YouCompleteMe Setup
" ==========================================
"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
let g:ycm_confirm_extra_conf = 0 
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']
if has("unix")
    let s:uname = system("uname")
    " Linux
    let g:ycm_server_python_interpreter = '/nfshome/jhmin/lnx.tools/bin/python3.7'
endif
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist = {}
let g:ycm_show_diagnostics_ui = 1   " ycm's syntax highlighting

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>p :YcmCompleter GetParent<CR>
nnoremap <leader>v :vs<CR>:YcmCompleter GoTo<CR>

" ==========================================
" Theme Setup
" ==========================================
"colorscheme jellybeans
"
"set termguicolors
"autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox
set bg=dark
let g:airline_theme='gruvbox'


if &term =~ "xterm"
    let &t_Co=256
    "    set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

" ==========================================
" vimspector Setup
" ==========================================
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>r :VimspectorReset<CR>
nmap <leader>w :VimspectorWatch<Space>


set mouse=a " press shift key to copy text outside of VIM
"set paste

set hlsearch
"hi Search ctermbg=DarkYellow
set splitright
set splitbelow
"
set wildmenu
set wildmode=list:longest


" Status line setting
"set laststatus=2

"set statusline=
"set statusline+=%#StatusLineStyle#%f
""set statusline+=%#PmenuSel#
"set statusline+=%#LineNr#
""set statusline+=\ %f
""set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ [%l:%c]
""set statusline+=\
""set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %f\


" ==========================================
" Tabspace without Makefile
" ==========================================
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
    set tabstop=4
    set shiftwidth=4
    "set softtabstop=4
endif

" --------------------------
" Calc function with python
" --------------------------
"command! -nargs=+ Calc :py print <args>
"python from math import *

" -------------------------
"  folding method
" -------------------------
"set foldmethod=syntax

"Open Directory
"nmap <C-E> :Explore<CR>
nmap ge    :Explore<CR>
nmap <C-e> :NERDTreeFind<CR>
xmap <C-e> <ESC>:NERDTreeFind<CR>
"map <C-n> :vs<CR>:E<CR>
nmap <C-n> :Vexplore!<CR>=
xmap <C-n> <ESC>:Vexplore!<CR>=

"Comment Toggle (NERD Commenter)
let g:NERDDefaultAlign = 'left'
map c <leader>c<space>

"Turn Off Highlight
map <F2>    :noh<CR>

" Normal mode backspace/space/enter
nmap <Del> "_x
xmap <Del> "_x
nmap <backspace> h"_x
nmap <space> i <ESC>l
nmap <CR> o<ESC>

"Macro
"map  <F2> qm
"map  <F3> q
"imap <F3> <ESC>q
"map  <F4> @m

"copy & paste
nmap <F9>      viw<F9>
xmap <F9>      "+y
imap <F9>      <ESC>viw<F9>
nmap <F10>     viw<F10>
xmap <F10>     "+p
imap <F10>     <ESC>"+pli
nmap <C-F10>   "+p
imap <C-F10>   <ESC><C-F10>
nmap <C-S-F10> "+P

"Quit / Save
nmap <Esc>q :q<CR>
xmap <Esc>q <ESC>:q<CR>
nmap <Esc>w :w<CR>
xmap <Esc>w <ESC>:w<CR>

"Easymotion
map L <leader><leader>w
map H <leader><leader>b
nmap gw <Plug>(easymotion-overwin-w)

"Tab Indent
nnoremap >       >>
nnoremap <       <<
xnoremap >       >gv
xnoremap <       <gv
map      <Tab>   >
map      <S-Tab> <
imap     <S-Tab> <ESC><

"<Home> means ^ not 0
map <Home> ^
imap <Home> <ESC>^i
map gh ^
map gl $


"Insert Mode
imap jk <ESC>
imap kj <ESC>
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>

" Control + 방향키 설정(윈도우 이동)
map  <C-Left>   <ESC><C-w><Left>
map  <C-Right>  <ESC><C-w><Right>
map  <C-Up>     <ESC><C-w><Up>
map  <C-Down>   <ESC><C-w><Down>
nmap <C-h>      <C-Left>
nmap <C-l>      <C-Right>
nmap <C-k>      <C-Up>
nmap <C-j>      <C-Down>

" Control + Shift + 방향키 설정(윈도우 크기 변경)
map  <C-S-Left>   <ESC><C-Left>10<C-W><<C-W><C-P>
map  <C-S-Right>  <ESC>10<C-W>>
"map  <C-S-Left>   <ESC><C-Left>:vertical resize -10<CR><C-W><C-P>
"map  <C-S-Right>  <ESC>:vertical resize +10<CR>
map  <C-S-Up>     <ESC><C-Up>10<C-W>-<C-W><C-P>
map  <C-S-Down>   <ESC>10<C-W>+


"declation align
nmap gd_maketempbus :'<,'>v/\v\[[^:]+:[^:]+\]\|^ *\/\//s/\v(input\|outputreg\|output\|inout\|wire\|reg)/\1 [x:x]<CR>
xmap gd_maketempbus <ESC>gd_maketempbus
nmap gd_align :'<,'>EasyAlign * /\v[\[:\];]\|(\/\/)/ v/\v^\/\//l2r1<CR>
xmap gd_align <ESC>gd_align
nmap gd_deltempbus :'<,'>s/\v\[( +)x( +):( +)x( +)\]/ \1 \2 \3 \4 /<CR>
xmap gd_deltempbus <ESC>gd_deltempbus
nmap gda :'<,'>s/output reg/outputreg<CR>gd_maketempbusgd_aligngd_deltempbus:'<,'>s/outputreg /output reg<CR>
xmap gda <ESC>gda
"instance align
nmap gia V/;<CR>k:EasyAlign */[.()]/l0r0<CR><F12>
"Align =
"xmap ga <Plug>(EasyAlign) 
xmap ga :EasyAlign =<CR>
xmap gs :EasyAlign<CR>* 
xmap gc :EasyAlign<CR>*,
xmap ge :EasyAlign<CR>
"let g:easy_align_delimiters = {
            "\ ']' : { 
            "\         'pattern'         :'[[\]]'  , 
            "\         'left_margin'     : '1'     ,
            "\         'right_margin'    : '1'     ,
            "\         'delimiter_align' : '0'     
            "\       }
"\}
