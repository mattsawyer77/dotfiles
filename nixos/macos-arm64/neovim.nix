self: super:
{
  # workaround for https://github.com/NixOS/nixpkgs/pull/133785
  lua51Packages = super.lua51Packages.extend (_: lsuper: {
    plenary-nvim = lsuper.plenary-nvim.overrideAttrs (_: {
      knownRockspec = (self.fetchurl {
        url = "https://raw.githubusercontent.com/nvim-lua/plenary.nvim/master/plenary.nvim-scm-1.rockspec";
        sha256 = "08kv1s66zhl9amzy9gx3101854ig992kl1gzzr51sx3szr43bx3x";
      });
    });
  });

  neovim = super.neovim.override {
    vimAlias = true;
    configure = {
      packages.myPlugins = with super.vimPlugins; {
        start = [
          plenary-nvim
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
          popup-nvim
          rust-tools-nvim
          sonokai
          supertab
          tcomment_vim
          telescope-nvim
          telescope-symbols-nvim
          telescope-fzf-native-nvim
          tender-vim
          vim-go
          vim-obsession
          vim-one
          vim-protobuf
          vim-startify
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
    };
  };
}
