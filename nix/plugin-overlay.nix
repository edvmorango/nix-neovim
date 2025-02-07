{inputs}: final: prev: let
  mkNvimPlugin = src: pname:
    prev.pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
      doCheck = false;
    };
in {
  nvimPlugins = {
    luasnip = mkNvimPlugin inputs.luasnip "luasnip";
    nvim-notify = mkNvimPlugin inputs.nvim-notify "nvim-notify";
    nvim-jqx = mkNvimPlugin inputs.nvim-jqx "nvim-jqx";
    plenary-nvim = mkNvimPlugin inputs.plenary-nvim "plenary-nvim";
    nvim-cmp = mkNvimPlugin inputs.nvim-cmp "nvim-cmp";
    nui-nvim = mkNvimPlugin inputs.nui-nvim "nui-nvim";
    conform-nvim = mkNvimPlugin inputs.conform-nvim "conform-nvim";
    trouble-nvim = mkNvimPlugin inputs.trouble-nvim "trouble-nvim";
    eagle-nvim = mkNvimPlugin inputs.eagle-nvim "eagle-nvim";
    diagflow-nvim = mkNvimPlugin inputs.diagflow-nvim "diagflow-nvim";
    actions-preview-nvim = mkNvimPlugin inputs.actions-preview-nvim "actions-preview-nvim";
    nvim-spider = mkNvimPlugin inputs.nvim-spider "nvim-spider";
    nvim-rooter-lua = mkNvimPlugin inputs.nvim-rooter-lua "nvim-rooter-lua";
    nvim-context-vt = mkNvimPlugin inputs.nvim-context-vt "nvim-context-vt";
    fidget-nvim = mkNvimPlugin inputs.fidget-nvim "fidget-nvim";
    nvim-lsp-notify = mkNvimPlugin inputs.nvim-lsp-notify "nvim-lsp-notify";
    indent-blankline-nvim = mkNvimPlugin inputs.indent-blankline-nvim "indent-blankline-nvim";
    nvim-treesitter = mkNvimPlugin inputs.nvim-treesitter "nvim-treesitter";
    noice-nvim = mkNvimPlugin inputs.noice-nvim "noice-nvim";
    nvim-metals = mkNvimPlugin inputs.nvim-metals "nvim-metals";
    nvim-lspconfig = mkNvimPlugin inputs.nvim-lspconfig "nvim-lspconfig";
    cmp-nvim-lsp = mkNvimPlugin inputs.cmp-nvim-lsp "cmp-nvim-lsp";
    lsp-status-nvim = mkNvimPlugin inputs.lsp-status-nvim "lsp-status-nvim";
    nvim-tree-lua = mkNvimPlugin inputs.nvim-tree-lua "nvim-tree-lua";
    nvim-web-devicons = mkNvimPlugin inputs.nvim-web-devicons "nvim-web-devicons";
    lualine-nvim = mkNvimPlugin inputs.lualine-nvim "lualine-nvim";
    lualine-lsp-progress = mkNvimPlugin inputs.lualine-lsp-progress "lualine-lsp-progress";
    cmp-luasnip = mkNvimPlugin inputs.cmp-luasnip "cmp-luasnip";
    inc-rename-nvim = mkNvimPlugin inputs.inc-rename-nvim "inc-rename-nvim";
    autoclose-nvim = mkNvimPlugin inputs.autoclose-nvim "autoclose-nvim";
    vim-rooter = mkNvimPlugin inputs.vim-rooter "vim-rooter";
    vim-scala = mkNvimPlugin inputs.vim-scala "vim-scala";
    hlargs-nvim = mkNvimPlugin inputs.hlargs-nvim "hlargs-nvim";
    scrollbar-nvim = mkNvimPlugin inputs.scrollbar-nvim "scrollbar-nvim";
    tidy-nvim = mkNvimPlugin inputs.tidy-nvim "tidy-nvim";
    nvim-nio = mkNvimPlugin inputs.nvim-nio "nvim-nio";
    neotest = mkNvimPlugin inputs.neotest "neotest";
    neotest-plenary = mkNvimPlugin inputs.neotest-plenary "neotest-plenary";
    neotest-scala = mkNvimPlugin inputs.neotest-scala "neotest-scala";
    onenord-nvim = mkNvimPlugin inputs.onenord-nvim "onenord-nvim";
    nvim-navic = mkNvimPlugin inputs.nvim-navic "nvim-navic";
    undotree = mkNvimPlugin inputs.undotree "undotree";
    rustaceanvim = mkNvimPlugin inputs.rustaceanvim "rustaceanvim";
    nvim-scissors = mkNvimPlugin inputs.nvim-scissors "nvim-scissors";
    lspkind-nvim = mkNvimPlugin inputs.lspkind-nvim "lspkind-nvim";
    yankbank-nvim = mkNvimPlugin inputs.yankbank-nvim "yankbank-nvim";
    unicode-vim = mkNvimPlugin inputs.unicode-vim "unicode-vim";
    vim-illuminate = mkNvimPlugin inputs.vim-illuminate "vim-illuminate";
    highlight-undo-nvim = mkNvimPlugin inputs.highlight-undo-nvim "highlight-undo-nvim";
    vim-cabalfmt = mkNvimPlugin inputs.vim-cabalfmt "vim-cabalfmt";
    telescope-nvim = mkNvimPlugin inputs.telescope-nvim "telescope-nvim";
    telescope-lsp-handlers-nvim = mkNvimPlugin inputs.telescope-lsp-handlers-nvim "telescope-lsp-handlers-nvim";
    telescope-media-files-nvim = mkNvimPlugin inputs.telescope-media-files-nvim "telescope-media-files-nvim";
    telescope-hoogle-nvim = mkNvimPlugin inputs.telescope-hoogle-nvim "telescope-hoogle-nvim";
    telescope-ui-select-nvim = mkNvimPlugin inputs.telescope-ui-select-nvim "telescope-ui-select-nvim";
    telescope-undo-nvim = mkNvimPlugin inputs.telescope-undo-nvim "telescope-undo-nvim";
    search-nvim = mkNvimPlugin inputs.search-nvim "search-nvim";
    easypick-nvim = mkNvimPlugin inputs.easypick-nvim "easypick-nvim";
    telescope-glyph-nvim = mkNvimPlugin inputs.telescope-glyph-nvim "telescope-glyph-nvim";
    telescope-symbols-nvim = mkNvimPlugin inputs.telescope-symbols-nvim "telescope-symbols-nvim";
    telescope-rooter-nvim = mkNvimPlugin inputs.telescope-rooter-nvim "telescope-rooter-nvim";
  };
}

