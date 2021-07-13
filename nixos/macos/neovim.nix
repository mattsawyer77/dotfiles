self: super:
{
  neovim = super.neovim.override {
    vimAlias = true;
    configure = {
      packages.myPlugins = with super.vimPlugins; {
        start = [
          ayu-vim
          # coc-diagnostic
          # coc-fzf
          # coc-go
          # coc-highlight
          # coc-json
          # coc-nvim
          # coc-rust-analyzer
          # coc-yaml
          edge
          git-blame-nvim
          gitgutter
          jellybeans-nvim
          lualine-nvim
          lush-nvim
          lsp_extensions-nvim
          neogit
          nvcode-color-schemes-vim
          nvim-compe
          nvim-dap
          nvim-dap-ui
          nvim-lspconfig
          nvim-tree-lua
          nvim-treesitter
          nvim-web-devicons
          oceanic-next
          onedark-vim
          onehalf
          plenary-nvim
          popup-nvim
          rust-tools-nvim
          sonokai
          tcomment_vim
          telescope-nvim
          tender-vim
          vim-go
          vim-one
          vim-protobuf
          vim-surround
          vim-toml
          vim-yaml
        ];
        opt = [];
      };
      customRC = ''
        ${(builtins.readFile ./neovim/init.vim)}
        lua << EOF
        ${(builtins.readFile ./neovim/compe.lua)}
        ${(builtins.readFile ./neovim/lsp.lua)}
        ${(builtins.readFile ./neovim/lualine.lua)}
        ${(builtins.readFile ./neovim/rust-tools.lua)}
        ${(builtins.readFile ./neovim/telescope.lua)}
        ${(builtins.readFile ./neovim/tree-sitter.lua)}
EOF
      '';
#       customRC = ''
#           let mapleader = "\<Space>"
#           set scrolloff=3
#           set backspace=2
#           set tabstop=4
#           set softtabstop=4
#           set shiftwidth=4
#           set shiftround
#           set noexpandtab
#           set showtabline=0
#           set smartindent
#           set hidden
#           set laststatus=2
#           set splitright
#           set ignorecase
#           set smartcase  "- use case if any caps used
#           set incsearch  "- show match as search proceeds
#           set hlsearch   "- search highlighting
#           set history=1000
#           set magic
#           set visualbell
#           set noerrorbells
#           set wildignore+=build,.git,.npm,*.swp,*.tgz,*.zip,*.gz
#           set backupdir=/tmp
#           set noautochdir
#           set wildmenu
#           set wildmode=longest:list,full
#           set t_Co=256
#           set cursorline
#           set nu
#           set lazyredraw
#           set shortmess=a
#           set fillchars+=vert:\
#           set viewdir=~/.config/nvim/view
#           set tags=./tags,tags;/
#           silent! set termguicolors
#           silent! set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
#           set undofile
#           set undodir=~/.config/nvim/undo
#           set mouse=a

#           nnoremap <Space>: :lua require'telescope.builtin'.commands{}<CR>
#           nnoremap <Space>. :lua require'telescope.builtin'.find_files{}<CR>
#           nnoremap <Space>bb :lua require'telescope.builtin'.buffers{}<CR>
#           nnoremap <Space><Space> :lua require'telescope.builtin'.git_files{}<CR>
#           nnoremap <Space>sp :lua require'telescope.builtin'.live_grep{}<CR>
#           nnoremap <Space>bi :lua require'telescope.builtin'.file_browser{}<CR>
#           nnoremap <Space>fr :lua require'telescope.builtin'.oldfiles{}<CR>
#           nnoremap <F4> :lua require'telescope.builtin'.colorscheme{}<CR>
#           nnoremap <F4> :lua require'telescope.builtin'.colorscheme{}<CR>
#           nnoremap <Space>cJ :lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>
#           nnoremap <Space>ca :lua require'telescope.builtin'.lsp_range_code_actions{}<CR>
#           nnoremap <Space>op :NvimTreeToggle<CR>
#           nnoremap <Space>oP :NvimTreeFindFile<CR>
#           nnoremap <Space>cx :lua vim.lsp.diagnostic.set_loclist()<CR>
#           nnoremap <Space>en :lua vim.lsp.diagnostic.goto_next()<CR>
#           nnoremap <Space>ep :lua vim.lsp.diagnostic.goto_prev()<CR>

#           colorscheme ayu
#           lua << EOF

#           -- Compe setup
#           require'compe'.setup {
#             enabled = true;
#             autocomplete = true;
#             debug = false;
#             min_length = 1;
#             preselect = 'enable';
#             throttle_time = 80;
#             source_timeout = 200;
#             incomplete_delay = 400;
#             max_abbr_width = 100;
#             max_kind_width = 100;
#             max_menu_width = 100;
#             documentation = true;

#             source = {
#               path = true;
#               nvim_lsp = true;
#             };
#           }

#           local t = function(str)
#             return vim.api.nvim_replace_termcodes(str, true, true, true)
#           end

#           local check_back_space = function()
#               local col = vim.fn.col('.') - 1
#               if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
#                   return true
#               else
#                   return false
#               end
#           end

#           -- Use (s-)tab to:
#           --- move to prev/next item in completion menuone
#           --- jump to prev/next snippet's placeholder
#           _G.tab_complete = function()
#             if vim.fn.pumvisible() == 1 then
#               return t "<C-n>"
#             elseif check_back_space() then
#               return t "<Tab>"
#             else
#               return vim.fn['compe#complete']()
#             end
#           end
#           _G.s_tab_complete = function()
#             if vim.fn.pumvisible() == 1 then
#               return t "<C-p>"
#             else
#               return t "<S-Tab>"
#             end
#           end

#           -- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
#           -- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
#           -- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
#           -- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

#           -- telescope setup
#           require('telescope').setup{
#             defaults = {
#               vimgrep_arguments = {
#                 'rg',
#                 '--color=never',
#                 '--no-heading',
#                 '--with-filename',
#                 '--line-number',
#                 '--column',
#                 '--smart-case'
#               },
#               prompt_prefix = "> ",
#               selection_caret = "> ",
#               entry_prefix = "  ",
#               initial_mode = "insert",
#               selection_strategy = "reset",
#               sorting_strategy = "descending",
#               layout_strategy = "horizontal",
#               layout_config = {
#                 horizontal = {
#                   mirror = false,
#                 },
#                 vertical = {
#                   mirror = false,
#                 },
#               },
#               file_sorter =  require'telescope.sorters'.get_fuzzy_file,
#               file_ignore_patterns = {},
#               generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
#               winblend = 0,
#               border = {},
#               borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
#               color_devicons = true,
#               use_less = true,
#               path_display = {},
#               set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
#               file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
#               grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
#               qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

#               -- Developer configurations: Not meant for general override
#               buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
#             }
#           }


#           -- lsp setup
#           local nvim_lsp = require('lspconfig')

#           -- Use an on_attach function to only map the following keys
#           -- after the language server attaches to the current buffer
#           local on_attach = function(client, bufnr)
#             local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
#             local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

#             --Enable completion triggered by <c-x><c-o>
#             buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

#             -- Mappings.
#             local opts = { noremap=true, silent=true }

#             -- See `:help vim.lsp.*` for documentation on any of the below functions
#             buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
#             buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
#             buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
#             buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
#             buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
#             buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
#             buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
#             buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
#             buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
#             buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
#             buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
#             buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
#             buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
#             buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
#             buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
#             buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
#             buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

#           end

#           -- Use a loop to conveniently call 'setup' on multiple servers and
#           -- map buffer local keybindings when the language server attaches
#           local servers = { "gopls", "rust_analyzer", "tsserver", "yamlls" }
#           for _, lsp in ipairs(servers) do
#             nvim_lsp[lsp].setup {
#               on_attach = on_attach,
#               flags = {
#                 debounce_text_changes = 150,
#               }
#             }
#           end

#           -- rust-tools
#           local rust_tools_opts = {
#               tools = {
#                   -- automatically set inlay hints (type hints)
#                   -- There is an issue due to which the hints are not applied on the first
#                   -- opened file. For now, write to the file to trigger a reapplication of
#                   -- the hints or just run :RustSetInlayHints.
#                   -- default: true
#                   autoSetHints = true,

#                   -- whether to show hover actions inside the hover window
#                   -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
#                   -- default: true
#                   hover_with_actions = true,

#                   -- These apply to the default RustRunnables command
#                   runnables = {
#                       -- whether to use telescope for selection menu or not
#                       -- default: true
#                       use_telescope = true

#                       -- rest of the opts are forwarded to telescope
#                   },

#                   -- These apply to the default RustSetInlayHints command
#                   inlay_hints = {
#                       -- wheter to show parameter hints with the inlay hints or not
#                       -- default: true
#                       show_parameter_hints = true,

#                       -- prefix for parameter hints
#                       -- default: "<-"
#                       parameter_hints_prefix = "<- ",

#                       -- prefix for all the other hints (type, chaining)
#                       -- default: "=>"
#                       other_hints_prefix = "=> ",

#                       -- whether to align to the length of the longest line in the file
#                       max_len_align = false,

#                       -- padding from the left if max_len_align is true
#                       max_len_align_padding = 1,

#                       -- whether to align to the extreme right or not
#                       right_align = false,

#                       -- padding from the right if right_align is true
#                       right_align_padding = 7
#                   },

#                   hover_actions = {
#                       -- the border that is used for the hover window
#                       -- see vim.api.nvim_open_win()
#                       border = {
#                           {"╭", "FloatBorder"}, {"─", "FloatBorder"},
#                           {"╮", "FloatBorder"}, {"│", "FloatBorder"},
#                           {"╯", "FloatBorder"}, {"─", "FloatBorder"},
#                           {"╰", "FloatBorder"}, {"│", "FloatBorder"}
#                       },

#                       -- whether the hover action window gets automatically focused
#                       -- default: false
#                       auto_focus = false
#                   }
#               },

#               -- all the opts to send to nvim-lspconfig
#               -- these override the defaults set by rust-tools.nvim
#               -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
#               server = {} -- rust-analyer options
#                         }

#           require('rust-tools').setup(rust_tools_opts)

#           -- tree-sitter
#           require'nvim-treesitter.configs'.setup {
#             ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
#             -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
#             highlight = {
#               enable = true,              -- false will disable the whole extension
#               -- disable = { "c", "rust" },  -- list of language that will be disabled
#                                                   },
#           }

#           -- lualine
#           -- Eviline config for lualine
#           -- Author: shadmansaleh
#           -- Credit: glepnir
#           local lualine = require 'lualine'

#           -- Color table for highlights
#           local colors = {
#             bg = '#202328',
#             fg = '#bbc2cf',
#             yellow = '#ECBE7B',
#             cyan = '#008080',
#             darkblue = '#081633',
#             green = '#98be65',
#             orange = '#FF8800',
#             violet = '#a9a1e1',
#             magenta = '#c678dd',
#             blue = '#51afef',
#             red = '#ec5f67'
#                           }

#           local conditions = {
#             buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
#             hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
#             check_git_workspace = function()
#               local filepath = vim.fn.expand('%:p:h')
#               local gitdir = vim.fn.finddir('.git', filepath .. ';')
#               return gitdir and #gitdir > 0 and #gitdir < #filepath
#             end
#                          }

#           -- Config
#           local config = {
#             options = {
#               -- Disable sections and component separators
#               component_separators = "",
#               section_separators = "",
#               theme = {
#                 -- We are going to use lualine_c an lualine_x as left and
#                 -- right section. Both are highlighted by c theme .  So we
#                 -- are just setting default looks o statusline
#                 normal = {c = {fg = colors.fg, bg = colors.bg}},
#                 inactive = {c = {fg = colors.fg, bg = colors.bg}}
#               }
#             },
#             sections = {
#               -- these are to remove the defaults
#               lualine_a = {},
#               lualine_b = {},
#               lualine_y = {},
#               lualine_z = {},
#               -- These will be filled later
#               lualine_c = {},
#               lualine_x = {}
#             },
#             inactive_sections = {
#               -- these are to remove the defaults
#               lualine_a = {},
#               lualine_v = {},
#               lualine_y = {},
#               lualine_z = {},
#               lualine_c = {},
#               lualine_x = {}
#             }
#                              }

#           -- Inserts a component in lualine_c at left section
#           local function ins_left(component)
#             table.insert(config.sections.lualine_c, component)
#           end

#           -- Inserts a component in lualine_x ot right section
#           local function ins_right(component)
#             table.insert(config.sections.lualine_x, component)
#           end

#           ins_left {
#             function() return '▊' end,
#             color = {fg = colors.blue}, -- Sets highlighting of component
#             left_padding = 0 -- We don't need space before this
#           }

#           ins_left {
#             -- mode component
#             function()
#               -- auto change color according to neovims mode
#               local mode_color = {
#                 n = colors.red,
#                 i = colors.green,
#                 v = colors.blue,
#                 [''] = colors.blue,
#                 V = colors.blue,
#                 c = colors.magenta,
#                 no = colors.red,
#                 s = colors.orange,
#                 S = colors.orange,
#                 [''] = colors.orange,
#                 ic = colors.yellow,
#                 R = colors.violet,
#                 Rv = colors.violet,
#                 cv = colors.red,
#                 ce = colors.red,
#                 r = colors.cyan,
#                 rm = colors.cyan,
#                 ['r?'] = colors.cyan,
#                 ['!'] = colors.red,
#                 t = colors.red
#             }
#               vim.api.nvim_command(
#                   'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" ..
#                       colors.bg)
#               return ''
#             end,
#             color = "LualineMode",
#             left_padding = 0
#           }

#           ins_left {
#             -- filesize component
#             function()
#               local function format_file_size(file)
#                 local size = vim.fn.getfsize(file)
#                 if size <= 0 then return "" end
#                 local sufixes = {'b', 'k', 'm', 'g'}
#                 local i = 1
#                 while size > 1024 do
#                   size = size / 1024
#                   i = i + 1
#                 end
#                 return string.format('%.1f%s', size, sufixes[i])
#               end
#               local file = vim.fn.expand('%:p')
#               if string.len(file) == 0 then return "" end
#               return format_file_size(file)
#             end,
#             condition = conditions.buffer_not_empty
#           }

#           ins_left {
#             'filename',
#             condition = conditions.buffer_not_empty,
#             color = {fg = colors.magenta, gui = 'bold'}
#           }

#           ins_left {'location'}

#           ins_left {'progress', color = {fg = colors.fg, gui = 'bold'}}

#           ins_left {
#             'diagnostics',
#             sources = {'nvim_lsp'},
#             symbols = {error = ' ', warn = ' ', info = ' '},
#             color_error = colors.red,
#             color_warn = colors.yellow,
#             color_info = colors.cyan
#           }

#           -- Insert mid section. You can make any number of sections in neovim :)
#           -- for lualine it's any number greater then 2
#           ins_left {function() return '%=' end}

#           ins_left {
#             -- Lsp server name .
#             function()
#               local msg = 'No Active Lsp'
#               local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
#               local clients = vim.lsp.get_active_clients()
#               if next(clients) == nil then return msg end
#               for _, client in ipairs(clients) do
#                 local filetypes = client.config.filetypes
#                 if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
#                   return client.name
#                 end
#               end
#               return msg
#             end,
#             icon = ' LSP:',
#             color = {fg = '#ffffff', gui = 'bold'}
#                     }

#           -- Add components to right sections
#           ins_right {
#             'o:encoding', -- option component same as &encoding in viml
#             upper = true, -- I'm not sure why it's upper case either ;)
#             condition = conditions.hide_in_width,
#             color = {fg = colors.green, gui = 'bold'}
#           }

#           ins_right {
#             'fileformat',
#             upper = true,
#             icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
#             color = {fg = colors.green, gui = 'bold'}
#           }

#           ins_right {
#             'branch',
#             icon = '',
#             condition = conditions.check_git_workspace,
#             color = {fg = colors.violet, gui = 'bold'}
#           }

#           ins_right {
#             'diff',
#             -- Is it me or the symbol for modified us really weird
#             symbols = {added = ' ', modified = '柳 ', removed = ' '},
#             color_added = colors.green,
#             color_modified = colors.orange,
#             color_removed = colors.red,
#             condition = conditions.hide_in_width
#           }

#           ins_right {
#             function() return '▊' end,
#             color = {fg = colors.blue},
#             right_padding = 0
#           }

#           -- Now don't forget to initialize lualine
#           lualine.setup(config)
# EOF
#         '';
    };
  };
  # }
  # ];
}
