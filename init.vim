call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'neovim/nvim-lspconfig'

Plug 'ryanoasis/vim-devicons'
Plug 'github/copilot.vim'
" Git
Plug 'tpope/vim-fugitive'
" Statusline/tablines
Plug 'vim-airline/vim-airline'
Plug 'zefei/vim-wintabs'
" Highlight syntax
" Plug 'sheerun/vim-polyglot'
" Themes
Plug 'rakr/vim-one'

" Yank to system clipboard
Plug 'jabirali/vim-tmux-yank'

" Commenting
Plug 'tpope/vim-commentary' " Support JSX

" lf file manager support
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" terminal
Plug 'voldikss/vim-floaterm'

" tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Code formatter and linter
Plug 'jose-elias-alvarez/null-ls.nvim'
call plug#end()

set number

" General settings
set tabstop=4 

" Appearance
set termguicolors
colorscheme one
set background=dark
let g:airline_theme='one'

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ 'coc-toml',
  \ 'coc-svg',
  \ 'coc-prettier', 
  \ 'coc-pairs',
  \ 'coc-json', 
  \ 'coc-eslint',
  \ 'coc-css',
  \]

" Maps
let mapleader = "\<Space>"
inoremap jj <Esc>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <esc> :noh<return><esc> 

" ESLint
nmap <S-f> <Plug>(coc-codeaction)
" Rename as VSCode
nmap <F2> <Plug>(coc-rename)
" Commenting
xmap <C-/> <Plug>Commentary
nmap <C-/> <Plug>CommentaryLine
" Rename as VSCode
nmap <leader>rn <Plug>(coc-rename)
" Move lines up/down. Alternative to alt+up/down from VSCode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Wintab navigate
map <S-h> <Plug>(wintabs_previous)
map <S-l> <Plug>(wintabs_next)
map <S-w> <Plug>(wintabs_close)
" Floaterm
nnoremap   <silent>   <leader>j   :FloatermToggle<CR>
tnoremap   <silent>   <leader>j   <C-\><C-n>:FloatermToggle<CR>
" FZF
nmap <C-p> :GFiles<CR>
nmap <leader>s :Rg<CR>
" Telescope
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"LF
let g:lf_map_keys = 0
map <leader>k :Lf<CR>

""""""""""""""""
" HIGHLIGHTING "
""""""""""""""""

" highlight link CocHighlightText Visual
highlight CursorColumn ctermbg=16 gui=underline guisp=#454C5E
highlight CocWarningHighlight ctermfg=Yellow gui=undercurl guisp=Yellow
highlight link CocInfoHighlight JavaScriptBraces
highlight link CocErrorHighlight Error
highlight CocHintHighlight ctermfg=Red  guifg=Red
" Tabline
highlight TablineFill ctermfg=59 ctermbg=17 guifg=#748CB7 guibg=#3e4452

lua require("basic")
