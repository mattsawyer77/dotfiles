let mapleader = "\<Space>"
set scrolloff=3
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set noexpandtab
set showtabline=0
set smartindent
set hidden
set laststatus=2
set splitright
set ignorecase
set smartcase  "- use case if any caps used
set incsearch  "- show match as search proceeds
set hlsearch   "- search highlighting
set history=1000
set magic
set visualbell
set noerrorbells
set wildignore+=build,.git,.npm,*.swp,*.tgz,*.zip,*.gz
set backupdir=/tmp
set noautochdir
set wildmenu
set wildmode=longest:list,full
set t_Co=256
set cursorline
set nu
set lazyredraw
set shortmess=a
set fillchars+=vert:\
set viewdir=~/.config/nvim/view
set tags=./tags,tags;/
silent! set termguicolors
silent! set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set undofile
set undodir=~/.config/nvim/undo
set mouse=a

nnoremap <Space>: :lua require'telescope.builtin'.commands{}<CR>
nnoremap <Space>. :lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Space>bb :lua require'telescope.builtin'.buffers{}<CR>
nnoremap <Space><Space> :lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Space>sp :lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <Space>bi :lua require'telescope.builtin'.file_browser{}<CR>
nnoremap <Space>fr :lua require'telescope.builtin'.oldfiles{}<CR>
nnoremap <F4> :lua require'telescope.builtin'.colorscheme{}<CR>
nnoremap <F4> :lua require'telescope.builtin'.colorscheme{}<CR>
nnoremap <Space>cJ :lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>
nnoremap <Space>ca :lua require'telescope.builtin'.lsp_range_code_actions{}<CR>
nnoremap <Space>op :NvimTreeToggle<CR>
nnoremap <Space>oP :NvimTreeFindFile<CR>
nnoremap <Space>cx :lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <Space>en :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <Space>ep :lua vim.lsp.diagnostic.goto_prev()<CR>

colorscheme ayu
