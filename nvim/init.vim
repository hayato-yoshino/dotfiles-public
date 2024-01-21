if empty(glob('~/.config/nvim/autoload/plug.vim'))
	echo "Installing vim-plug..."
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	echo "vim-plug already installed."
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'arcticicestudio/nord-vim'
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
