require("packer").startup(function(use)
	--use("vim-scripts/loremipsum")

	use("wbthomason/packer.nvim")

	-- colorschemes
	-- tmux helpers
	-- use("christoomey/vim-tmux-navigator")
	-- use("tmux-plugins/vim-tmux")
	-- use("preservim/vimux")

	-- helpers
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	-- use("stephpy/vim-yaml")
	-- use("andrejlevkovitch/vim-lua-format")
	-- use("kyazdani42/nvim-web-devicons")
	-- use("haringsrob/nvim_context_vt")
	-- use({ "michaelb/sniprun", run = "bash install.sh" })
	-- use("https://github.com/airblade/vim-rooter")
	-- use("raimondi/delimitmate")
	--
	-- completion
	use("hrsh7th/nvim-compe")
	-- use 'hrsh7th/nvim-cmp'
	-- use 'hrsh7th/cmp-buffer'
	-- use'https://github.com/hrsh7th/cmp-nvim-lsp'
	-- use("nvim-treesitter/completion-treesitter")
	-- use("hrsh7th/vim-vsnip")
	-- use("rafamadriz/friendly-snippets")
	-- use("glepnir/lspsaga.nvim")
	-- use("nvim-telescope/telescope.nvim")
	--
	-- use("dhruvmanila/telescope-bookmarks.nvim")
	-- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- use("jvgrootveld/telescope-zoxide")
	-- use("https://github.com/camgraff/telescope-tmux.nvim")
	-- use("nvim-telescope/telescope-project.nvim")
	-- use("nvim-telescope/telescope-frecency.nvim")
	-- use("nvim-telescope/telescope-packer.nvim")
	-- use 'nvim-telescope/telescope-dap.nvim'
	--
	-- use 'pocco81/dapinstall.nvim'
	-- use("tami5/sql.nvim")
	-- use 'nvim-telescope/telescope-cheat.nvim'
	-- use({
	-- "nvim-telescope/telescope-arecibo.nvim",
	-- rocks = { "openssl", "lua-http-parser" },
	-- })
	-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	--
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use("folke/tokyonight.nvim")
	--
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	-- use("tpope/vim-fugitive")
	-- use({ "ray-x/lsp_signature.nvim",config=require "lsp_signature".setup()
	-- })
	--
	-- use("nacro90/numb.nvim")
	-- use("tpope/vim-dispatch")
	-- use("nvim-lua/lsp_extensions.nvim")
	-- use 'tpope/vim-eunuch'
	-- use("tpope/vim-surround")
	-- use 'tpope/vim-obsession'
	-- use 'tpope/vim-unimpaired'
	-- use("mfussenegger/nvim-dap")
	-- use("mfussenegger/nvim-dap-python")
	-- use("folke/lsp-trouble.nvim")
	-- use("liuchengxu/vista.vim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	--
	-- use("nvim-treesitter/playground")
	-- use("justinmk/vim-gtfo")
	use("neovim/nvim-lspconfig")
	-- use("romainl/vim-qf")
	-- use("simrat39/rust-tools.nvim")
	-- use({ "prettier/vim-prettier", run = "yarn install" })
	-- use("https://github.com/rrethy/vim-illuminate")
	-- use("yggdroot/indentline")
	-- use("https://github.com/alx741/vim-rustfmt")
	-- use("justinmk/vim-sneak")
	-- use("luochen1990/rainbow")
	-- use("junegunn/rainbow_parentheses.vim")
	-- use("nvie/vim-flake8")
	-- use("maxmellon/vim-jsx-pretty")
	-- use 'rafcamlet/coc-nvim-lua'

	-- use("https://github.com/szw/vim-maximizer")
	-- use("xolox/vim-lua-ftplugin")
	-- use("xolox/vim-misc")
	-- use("AndrewRadev/tagalong.vim")
	-- use("godlygeek/tabular")
	-- use("plasticboy/vim-markdown")
	-- use("voldikss/vim-floaterm")
	-- use("Chiel92/vim-autoformat")
	-- use("sbdchd/neoformat")
	-- use 'vim-airline/vim-airline'
	-- use("JamshedVesuna/vim-markdown-preview")
	-- use("xuhdev/vim-latex-live-preview")
	--
	-- use {'iamcco/markdown-preview.nvim',run= 'cd app && yarn install'  }
	-- use {
	--     'ray-x/navigator.lua',
	--     requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
	-- }
	-- use("chemzqm/denite-extra")
	-- use {'josa42/coc-lua', run = 'yarn install --frozen-lockfile'}
	-- use 'xolox/vim-misc'
	-- use("tbastos/vim-lua")
	-- use("lfilho/cosco.vim")
	use("preservim/nerdcommenter")
	-- use 'junegunn/fzf.vim'
	-- use 'chiefnoah/neuron-v2.vim'
	-- use("w0rp/ale")
	-- use("mhinz/vim-startify")
	-- use 'ianks/vim-tsx'
	-- use 'rbgrouleff/bclose.vim'
	-- use {'Shougo/denite.nvim', run = ':UpdateRemotePlugins'}
	-- use("lilydjwg/colorizer")
	-- use("jiangmiao/auto-pairs")
	-- use("alvan/vim-closetag")
	-- use("vim-ctrlspace/vim-ctrlspace")
	-- use 'puremourning/vimspector'
	-- use("jbyuki/venn.nvim")
	-- use({ "vhyrro/neorg", requires = "nvim-lua/plenary.nvim" })
	--
	-- use("mfussenegger/nvim-jdtls")
	--
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	--
	-- use({ "folke/lua-dev.nvim" })
	-- use("https://github.com/kmonad/kmonad-vim")
	-- use 'https://github.com/nicwest/vim-workman'
	--
	-- use({
	-- "rcarriga/nvim-notify",
	-- config = function()
	-- vim.notify = require("notify")
	-- end,
	-- })
	--
	-- use({
	-- "ThePrimeagen/refactoring.nvim",
	-- requires = {
	-- { "nvim-lua/plenary.nvim" },
	-- { "nvim-treesitter/nvim-treesitter" },
	-- },
	-- })
	-- use({ "windwp/nvim-autopairs", config = require("nvim-autopairs").setup({}) })
	-- use({ "tamago324/lir.nvim" })
	-- use 'ThePrimeagen/harpoon'
	-- use ('~/github/harpoon/add_term_cmds')
	-- use 'ThePrimeagen/git-worktree.nvim'
	--
	-- use({
	-- "folke/persistence.nvim",
	-- event = "BufReadPre", -- this will only start session saving when an actual file was opened
	-- module = "persistence",
	-- config = function()
	-- require("persistence").setup()
	-- end,
	-- })
	-- use 'RishabhRD/popfix'
	-- use 'RishabhRD/nvim-lsputils'
	-- use 'mbbill/undotree'
	-- use 'GustavoKatel/sidebar.nvim'
	-- use 'tpope/vim-scriptease'
	-- use 'ggandor/lightspeed.nvim'
	-- use 'kshenoy/vim-signature'
end)
