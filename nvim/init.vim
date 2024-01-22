if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sheerun/vim-polyglot'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-commentary'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'mattn/vim-maketable'
	Plug 'rhysd/vim-clang-format', {'for': 'cpp'}
	Plug 'dense-analysis/ale'
	Plug 'tpope/vim-endwise', {'for': 'ruby'}
	Plug 'github/copilot.vim'
	Plug 'andymass/vim-matchup'
	Plug 'Yggdroot/indentLine'
	Plug 'lambdalisue/gin.vim'
call plug#end()

set nonumber
set mouse=
set nowrap
set termguicolors
set tabstop=2
set shiftwidth=2
set smartindent
set clipboard=unnamed
set signcolumn=yes
" ウィンドウ背景を透明化
set winblend=30
set pumblend=30
" 対応する括弧をハイライト
set showmatch
autocmd FileType php setlocal sw=4 ts=4 sts=4 et
autocmd FileType go setlocal sw=4 ts=4 sts=4 noet
autocmd FileType sh setlocal sw=4 ts=4 sts=4 et
language message C
colorscheme nord

let mapleader = "\<space>"

nnoremap <Leader>w :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <silent> <C-p> :bprevious<CR>
nnoremap <silent> <C-n> :bnext<CR>

" 削除キーでヤンクしない
nnoremap x "_x
nnoremap D "_D
nnoremap dd "_dd

" 行が折り返されていても視覚的に1行上下に移動
nnoremap j gj
nnoremap k gk
" ノーマルモードを維持し，次の行に空行のみ追加する
nnoremap <silent> <S-o> :<C-u>call append(expand('.'), '')<Cr>j
" 検索結果ハイライト無効化
nnoremap <C-c><C-c> :nohlsearch<CR>
" 現在のファイル名をコピー
nnoremap <Leader>p :let @+ = expand('%')<CR>

imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <silent> <C-k> <Plug>(copilot-next)
imap <silent> <C-j> <Plug>(copilot-previous)
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
" 全角の括弧
inoremap （ （）<Left>
inoremap 「 「」<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
" Enter or C-m は補完ウィンドウで改行ではなく、確定挙動にする
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-m> pumvisible() ? "\<C-y>" : "\<C-m>"

cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap " ""<Left>
cnoremap ' ''<Left>
cnoremap ` ``<Left>
cnoremap ( ()<Left>
cnoremap [ []<Left>
cnoremap { {}<Left>

tnoremap <C-[> <C-\><C-n>
tnoremap " ""<Left>
tnoremap ' ''<Left>
tnoremap ` ``<Left>
tnoremap ( ()<Left>
tnoremap [ []<Left>
tnoremap { {}<Left>

autocmd TermOpen * setlocal nonumber
" ターミナルモードに入った時，インサートモードから開始
autocmd TermOpen * :startinsert

""""""""""""""""
" fzf
""""""""""""""""
nnoremap <silent> <C-j> :Files<CR>
nnoremap <silent> <C-h> :Buffers<CR>
nnoremap <silent> <Leader><C-j> :<C-u>silent call <SID>find_rip_grep()<CR>

function! s:find_rip_grep() abort
    call fzf#vim#grep(
                \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+ --glob "!{.git,tags}"',
                \   1,
                \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
                \   0,
                \ )
endfunction

""""""""""""""""
" easymotion
""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)
map <Leader>f <Plug>(easymotion-bd-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

""""""""""""""""
" defx
""""""""""""""""
nnoremap <silent> <C-k> :Defx<CR>
let g:python3_host_prog = '~/.pyenv/shims/python3'
" 隠しファイルをデフォルトで表示
call defx#custom#option('_', {
    \ 'show_ignored_files': 1,
    \ })
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

"""""""""""""""
" airline
""""""""""""""""
" 事前に powerline fonts をインストール必要
let g:airline_powerline_fonts = 1
" 上部タブにファイル名表示
let g:airline#extensions#tabline#enabled = 1
" git branch 名表示
let g:airline#extensions#branch#enabled = 1
