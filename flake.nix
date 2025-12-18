{
  description = "Neovim derivation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";

    flake-utils.url = "github:numtide/flake-utils";

    hover-nvim = {
      url = "github:lewis6991/hover.nvim";
      flake = false;
    };

    tla-nvim = {
      url = "github:susliko/tla.nvim";
      flake = false;
    };

    blink-cmp = {
      url = "github:Saghen/blink.cmp";
      flake = true;
    };

    charleston-nvim = {
      url = "github:RomanAverin/charleston.nvim";
      flake = false;
    };

    vague-nvim = {
      url = "github:vague2k/vague.nvim";
      flake = false;
    };

    nvim-jqx = {
      url = "github:gennaro-tedesco/nvim-jqx";
      flake = false;
    };

    nvim-notify = {
      url = "github:rcarriga/nvim-notify";
      flake = false;
    };

    plenary-nvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    nui-nvim = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };
    conform-nvim = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };
    trouble-nvim = {
      url = "github:folke/trouble.nvim";
      flake = false;
    };
    eagle-nvim = {
      url = "github:soulis-1256/eagle.nvim";
      flake = false;
    };
    diagflow-nvim = {
      url = "github:dgagn/diagflow.nvim";
      flake = false;
    };
    actions-preview-nvim = {
      url = "github:aznhe21/actions-preview.nvim";
      flake = false;
    };
    nvim-spider = {
      url = "github:chrisgrieser/nvim-spider";
      flake = false;
    };
    nvim-rooter-lua = {
      url = "github:notjedi/nvim-rooter.lua";
      flake = false;
    };
    nvim_context_vt = {
      url = "github:andersevenrud/nvim_context_vt";
      flake = false;
    };
    fidget-nvim = {
      url = "github:j-hui/fidget.nvim";
      flake = false;
    };
    nvim-lsp-notify = {
      url = "github:mrded/nvim-lsp-notify";
      flake = false;
    };
    indent-blankline-nvim = {
      url = "github:lukas-reineke/indent-blankline.nvim";
      flake = false;
    };
    nvim-treesitter = {
      url = "github:nvim-treesitter/nvim-treesitter?ref=master";

      flake = false;
    };
    noice-nvim = {
      url = "github:folke/noice.nvim";
      flake = false;
    };
    nvim-metals = {
      url = "github:scalameta/nvim-metals";
      flake = false;
    };
    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    nvim-tree-lua = {
      url = "github:nvim-tree/nvim-tree.lua";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:nvim-tree/nvim-web-devicons";
      flake = false;
    };
    lualine-nvim = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };
    lualine-lsp-progress = {
      url = "github:arkav/lualine-lsp-progress";
      flake = false;
    };
    cmp-luasnip = {
      url = "github:saadparwaiz1/cmp_luasnip";
      flake = false;
    };
    luasnip = {
      url = "github:L3MON4D3/LuaSnip";
      flake = false;
    };
    inc-rename-nvim = {
      url = "github:smjonas/inc-rename.nvim";
      flake = false;
    };
    autoclose-nvim = {
      url = "github:m4xshen/autoclose.nvim";
      flake = false;
    };
    vim-rooter = {
      url = "github:edvmorango/vim-rooter";
      flake = false;
    };
    vim-scala = {
      url = "github:gvolpe/vim-scala";
      flake = false;
    };
    hlargs-nvim = {
      url = "github:m-demare/hlargs.nvim";
      flake = false;
    };
    scrollbar-nvim = {
      url = "github:Xuyuanp/scrollbar.nvim";
      flake = false;
    };
    tidy-nvim = {
      url = "github:mcauley-penney/tidy.nvim";
      flake = false;
    };
    nvim-nio = {
      url = "github:nvim-neotest/nvim-nio";
      flake = false;
    };
    neotest = {
      url = "github:nvim-neotest/neotest";
      flake = false;
    };
    neotest-plenary = {
      url = "github:nvim-neotest/neotest-plenary";
      flake = false;
    };
    neotest-scala = {
      url = "github:stevanmilic/neotest-scala";
      flake = false;
    };
    onenord-nvim = {
      url = "github:rmehri01/onenord.nvim";
      flake = false;
    };
    nvim-navic = {
      url = "github:SmiteshP/nvim-navic";
      flake = false;
    };
    undotree = {
      url = "github:mbbill/undotree";
      flake = false;
    };
    nvim-scissors = {
      url = "github:chrisgrieser/nvim-scissors";
      flake = false;
    };
    lspkind-nvim = {
      url = "github:onsails/lspkind.nvim";
      flake = false;
    };
    yankbank-nvim = {
      url = "github:ptdewey/yankbank-nvim";
      flake = false;
    };
    unicode-vim = {
      url = "github:chrisbra/unicode.vim";
      flake = false;
    };
    vim-illuminate = {
      url = "github:RRethy/vim-illuminate";
      flake = false;
    };
    highlight-undo-nvim = {
      url = "github:tzachar/highlight-undo.nvim";
      flake = false;
    };
    vim-cabalfmt = {
      url = "github:sdiehl/vim-cabalfmt";
      flake = false;
    };
    telescope-nvim = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };
    telescope-lsp-handlers-nvim = {
      url = "github:gbrlsnchs/telescope-lsp-handlers.nvim";
      flake = false;
    };
    telescope-media-files-nvim = {
      url = "github:nvim-telescope/telescope-media-files.nvim";
      flake = false;
    };
    telescope-hoogle-nvim = {
      url = "github:psiska/telescope-hoogle.nvim";
      flake = false;
    };
    telescope-ui-select-nvim = {
      url = "github:nvim-telescope/telescope-ui-select.nvim";
      flake = false;
    };
    telescope-undo-nvim = {
      url = "github:debugloop/telescope-undo.nvim";
      flake = false;
    };
    search-nvim = {
      url = "github:FabianWirth/search.nvim";
      flake = false;
    };
    easypick-nvim = {
      url = "github:axkirillov/easypick.nvim";
      flake = false;
    };
    telescope-glyph-nvim = {
      url = "github:ghassan0/telescope-glyph.nvim";
      flake = false;
    };
    telescope-symbols-nvim = {
      url = "github:nvim-telescope/telescope-symbols.nvim";
      flake = false;
    };
    telescope-rooter-nvim = {
      url = "github:desdic/telescope-rooter.nvim";
      flake = false;
    };
    nvim-context-vt = {
      url = "github:andersevenrud/nvim_context_vt";
      flake = false;
    };

    substitute-nvim = {
      url = "github:gbprod/substitute.nvim";
      flake = false;
    };

    gitsigns-nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };

    nvim-unception = {
      url = "github:samjwill/nvim-unception";
      flake = false;
    };

    nvim-surround = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };

    evergarden = {
      url = "github:comfysage/evergarden";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    neovim-nightly,
    gen-luarc,
    flake-utils,
    ...
  }: let
    systems = builtins.attrNames nixpkgs.legacyPackages;

    # This is where the Neovim derivation is built.
    plugin-overlay = import ./nix/plugin-overlay.nix {inherit inputs;};
    neovim-overlay = import ./nix/neovim-overlay.nix {inherit inputs;};
  in
    flake-utils.lib.eachSystem systems (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            # Import the overlay, so that the final Neovim derivation(s) can be accessed via pkgs.<nvim-pkg>
            plugin-overlay
            neovim-overlay
            # This adds a function can be used to generate a .luarc.json
            # containing the Neovim API all plugins in the workspace directory.
            # The generated file can be symlinked in the devShell's shellHook.
            gen-luarc.overlays.default
            neovim-nightly.overlays.default
          ];
        };
        shell = pkgs.mkShell {
          name = "nvim-devShell";
          buildInputs = with pkgs; [
            # Tools for Lua and Nix development, useful for editing files in this repo
            lua-language-server
            nil
            stylua
            luajitPackages.luacheck
            nvim-dev
          ];
          shellHook = ''
            # symlink the .luarc.json generated in the overlay
            ln -fs ${pkgs.nvim-luarc-json} .luarc.json
            # allow quick iteration of lua configs
            ln -Tfns $PWD/nvim ~/.config/nvim-dev
          '';
        };
      in {
        packages = rec {
          default = nvim;
          nvim = pkgs.nvim-pkg;
        };
        devShells = {
          default = shell;
        };
      }
    )
    // {
      # You can add this overlay to your NixOS configuration
      overlays.default = neovim-overlay;
    };
}
