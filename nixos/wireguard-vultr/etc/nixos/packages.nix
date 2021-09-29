{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    bind
    git
    tmux
    unbound
    # vim
    wireguard
    eternal-terminal
    pcre
    python
    (neovim.override {
      configure = {
        packages.myVimPackage = with pkgs.vimPlugins; {
          start = [
            vim-surround
            ale
            LanguageClient-neovim
            The_NERD_Commenter
            The_NERD_tree
            airline
            base16-vim
            ctrlp
            deoplete-nvim
            fugitive
            neoformat
						vim-nix
         ];
         opt = [ ];
       };
       customRC = ''
         set scrolloff=3
         set backspace=2
         set tabstop=2
         set softtabstop=2
         set shiftwidth=2
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
         set wildignore+=.git,.npm,*.swp,*.tgz,*.zip,.terraform,*.gz
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
         set tags=./tags,tags;/
         silent! set termguicolors
         silent! set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
         set undofile
         set undodir=/tmp
         set mouse=a
         colo base16-tomorrow-night
       '';
     };
   })];
}
