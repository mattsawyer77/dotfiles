" general settings
" set shell='/usr/local/bin/zsh'
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
