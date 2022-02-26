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
                                        


" BASIC SETTINGS
" ===============================================
syntax on
set number
set relativenumber                  " relative number
set tabstop=4
set shiftwidth=4
set expandtab                       " use space as tabs
set ignorecase                      " ignore case search
let g:mapleader=" "                 " change the leader key
set mouse=a                         " mouse on
set pumheight=10                    " popup menu height
set noshowmode                      " don't show mode
set signcolumn=yes                  " always show sign column
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
autocmd VimEnter * set formatoptions-=cro " disable auto 
" autocmd VimEnter * NvimTreeOpen
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
nnoremap <silent><C-z> :resize -2<CR>
nnoremap <silent><C-x> :resize +2<CR>

" quick window navigationn
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

" disable highlight after search
nnoremap <silent> <leader>s :noh<CR>

" BUFFERLINE
" move over buffers
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bNext<CR>
" save and force quit
nnoremap <silent> <leader>S :w<CR>:Bdelete<CR>
nnoremap <silent> <leader>K :Bdelete!<CR>

" FZF
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :Rg<CR>
nnoremap <silent> <leader>fb :Buffers<CR>

" TOGGLETERM
nnoremap <silent> <leader>tlg :lua _LAZYGIT_TOGGLE()<CR>
nnoremap <silent> <leader>tpy :lua _PYTHON_TOGGLE()<CR>
nnoremap <silent> <leader>tht :lua _HTOP_TOGGLE()<CR>
nnoremap <silent> <leader>tnd :lua _NODE_TOGGLE()<CR>

" VISTA.VIM
nnoremap <silent> <leader>V :Vista!!<CR>
" ==============================================



" plugins 
" ===============================================
call plug#begin('~/.local/share/nvim/plugged')



" WRITING HELPERS
Plug 'nvim-lualine/lualine.nvim'
" Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'                                " status line
Plug 'jiangmiao/auto-pairs'                                 " auto complete brackets
Plug 'gcmt/wildfire.vim'                                    " visual highlight code block
Plug 'tpope/vim-surround'                                   " change surroundings
Plug 'junegunn/vim-peekaboo'                                " register viewer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " better syntax highlight
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'                              " git highlight

" BASICS
Plug 'kyazdani42/nvim-tree.lua'                             " file tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'                              " tabs
Plug 'moll/vim-bbye'

" THEMES
Plug 'joshdick/onedark.vim'
Plug 'lunarvim/colorschemes'
Plug 'EdenEast/nightfox.nvim'

" IDE FEATURES
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'liuchengxu/vista.vim'                                 " overlook
Plug 'junegunn/fzf.vim'                                     " fuzzy file finder
Plug 'akinsho/toggleterm.nvim'                              " integrated terminal
Plug 'puremourning/vimspector'                              " debugger
call plug#end()

" ==============================================



" Plugin settings
" ==============================================
" LIGHTLINE.VIM
" enable the extension
set laststatus=2
set t_Co=256
lua << END
require('lualine').setup{}
END
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#left_sep = '|'
" let g:lightline = {
"     \ 'colorscheme': 'PaperColor',
"     \ 'active': {
"     \   'left': [  [ 'mode', 'paste' ] ,
"     \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
"     \ 
"     \   'right': [ [ 'lineinfo' ],
"     \              [ 'percent' ],
"     \              [ 'fileformat', 'fileencoding', 'filetype'] ]
"     \ },
"     \ 'component_funcion': {
"     \    'gitbranch': 'gitbranch#name'
"     \ },
"     \ }


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


" NVIM-TREESITTER
lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "cuda",
    "dockerfile",
    "fish",
    "go",
    "hjson",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "json5",
    "kotlin",
    "latex",
    "llvm",
    "lua",
    "make",
    "php",
    "python",
    "r",
    "ruby",
    "rust",
    "scss",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  sync_install = false,
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
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
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


" TOGGLETERM
lua << EOF
require("toggleterm").setup({
	size = 20,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	direction = "float",
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Rounded",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "ipython", hidden = true })

function _PYTHON_TOGGLE()
	python:toggle()
end
EOF

" VISTA.VIM
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'

" VIMSPECTOR
let g:vimspector_enable_mappings = 'HUMAN'

" COC.NVIM
" extensions
let g:coc_global_extensions = [
            \"coc-pyright", 
            \"coc-json", 
            \"coc-vimlsp", 
            \"coc-html", 
            \"coc-java", 
            \"coc-css"
            \] 
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
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" COLORSCHEME
colorscheme nightfox
let g:airline_theme="distinguished"

" FZF
set rtp+=~/.fzf

" ==============================================
