# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix {inherit pkgs-wrapNeovim;};

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = with pkgs.nvimPlugins; [
    charleston-nvim
    blink-cmp
    vague-nvim
    evergarden
    nvim-unception
    nvim-surround
    gitsigns-nvim
    substitute-nvim
    luasnip
    nvim-notify
    plenary-nvim
    nvim-cmp
    nui-nvim
    conform-nvim
    trouble-nvim
    eagle-nvim
    diagflow-nvim
    actions-preview-nvim
    nvim-spider
    nvim-rooter-lua
    nvim-context-vt
    fidget-nvim
    nvim-lsp-notify
    indent-blankline-nvim
    nvim-treesitter
    noice-nvim
    nvim-metals
    cmp-nvim-lsp
    lsp-status-nvim
    nvim-tree-lua
    nvim-web-devicons
    lualine-nvim
    lualine-lsp-progress
    cmp-luasnip
    inc-rename-nvim
    autoclose-nvim
    vim-rooter
    vim-scala
    hlargs-nvim
    scrollbar-nvim
    tidy-nvim
    nvim-nio
    neotest
    neotest-plenary
    neotest-scala
    onenord-nvim
    nvim-navic
    undotree
    nvim-scissors
    lspkind-nvim
    yankbank-nvim
    unicode-vim
    vim-illuminate
    highlight-undo-nvim
    vim-cabalfmt
    telescope-nvim
    telescope-lsp-handlers-nvim
    telescope-media-files-nvim
    telescope-hoogle-nvim
    telescope-ui-select-nvim
    telescope-undo-nvim
    search-nvim
    easypick-nvim
    telescope-glyph-nvim
    telescope-symbols-nvim
    telescope-rooter-nvim
    nvim-jqx
  ];

  extraPackages = with pkgs; [
    # language servers, etc.
    lua-language-server
    nil # nix LSP
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This is meant to be used within a devshell.
  # Instead of loading the lua Neovim configuration from
  # the Nix store, it is loaded from $XDG_CONFIG_HOME/nvim-dev
  nvim-dev = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
    appName = "nvim-dev";
    wrapRc = false;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
