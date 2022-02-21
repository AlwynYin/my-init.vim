"   ___  _                      _     
"  / _ \| |                    ( )    
" / /_\ \ |_      ___   _ _ __ |/ ___ 
" |  _  | \ \ /\ / / | | | '_ \  / __|
" | | | | |\ V  V /| |_| | | | | \__ \
" \_| |_/_| \_/\_/  \__, |_| |_| |___/
"                   __/ |            
"                  |___/             
"                                       
"  _   _  _____ _____  _   _ ________  ___
" | \ | ||  ___|  _  || | | |_   _|  \/  |
" |  \| || |__ | | | || | | | | | | .  . |
" | . ` ||  __|| | | || | | | | | | |\/| |
" | |\  || |___\ \_/ /\ \_/ /_| |_| |  | |
" \_| \_/\____/ \___/  \___/ \___/\_|  |_/
"
"
" obtained from online drawer:
" http://patorjk.com/software/taag/#p=display&f=Doom&t=NEOVIM
                                        


" basic settings
" ===============================================
syntax on
set number
set relativenumber                  " relative number
set tabstop=4
set shiftwidth=4
set expandtab                       " use space as tabs"
set ignorecase                      " ignore case search
let g:mapleader=" "                 " change the leader key
set mouse=a                         " mouse on
set pumheight=10                    " popup menu height
set noshowmode                      " don't show mode
set signcolumn=yes                  "always show sign column
set smartcase                       " smart case search
set smartindent                     " smart indent
set splitbelow                      " force split below
set splitright                      " force split right
set timeoutlen=1000 
set updatetime=100                  " more responsive
set showtabline=1
set writebackup
set cursorline
set nowrap                          " display line as long line
set scrolloff=4                     " cursor stops at 4 lines when scrolling
set guifont="JetBrainsMono Nerd Font Mono:h20"
set whichwrap+=<,>,[,],h,l
set iskeyword-=_
" ==============================================



" key maps
" =============================================
" map emacs keys
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-p> <up>
inoremap <c-n> <down>
inoremap <c-a> <home>
inoremap <c-e> <end>

" quickly resize window
nnoremap <silent><C-o> :vertical resize -2<CR>
nnoremap <silent><C-p> :vertical resize +2<CR>
nnoremap <silent><S-o> :resize -2<CR>
nnoremap <silent><S-p> :resize +2<CR>

" disable highlight after search
nnoremap <silent> <leader>s :noh<CR>

" ==============================================



" plugins 
" ===============================================
call plug#begin('~/.config/nvim/plugged')



" WRITING HELPERS
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'                                 " auto complete brackets
Plug 'gcmt/wildfire.vim'                                    " visual highlight code block
Plug 'tpope/vim-surround'                                   " change surroundings
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " better syntax highlight
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'                              " git highlight

" BASICS
Plug 'kyazdani42/nvim-tree.lua'                             " file tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'                              " tabs
Plug 'moll/vim-bbye'
Plug 'voldikss/vim-floaterm'                                " terminal

" THEMES
Plug 'joshdick/onedark.vim'
Plug 'lunarvim/colorschemes'
Plug 'EdenEast/nightfox.nvim'

" IDE FEATURES

Plug 'mhinz/vim-startify'                                   " welcome panel
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
call plug#end()
" ==============================================
"
"
"
" Plugin settings
" ==============================================
" VIM-AIRLINE
" enable the extension
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts = 1


" NVIM-TREE
lua require'nvim-tree'.setup()
nnoremap <silent> <leader>e :NvimTreeToggle<CR>
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.


" BUFFERLINE.NVIM
lua << EOF
require("bufferline").setup{
    options = {
        offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
              padding = 1
            },
        }
    }
}
EOF
" move along buffers
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>


" NVIM-TREESITTER
lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "ocamllex", "teal" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}
EOF


" GITSIGNS
lua << EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF


" COC-NVIM
" extensions
let g:coc_global_extensions = [
            \"coc-pyright", 
            \"coc-json", 
            \"coc-vimlsp", 
            \"coc-html", 
            \"coc-java", 
            \"coc-css"] 
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" floaterm
nnoremap <silent> <C-\> :FloatermNew<CR>
nnoremap <leader>t :FloatermNew! 
let g:floaterm_width=0.9
let g:floaterm_height=0.9
" ==============================================


" OTHERS
" color scheme
colorscheme nightfox
let g:airline_theme="distinguished"
" fzf
set rtp+=~/.fzf
nnoremap <leader>F :FZF<CR>
