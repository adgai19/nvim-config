-- local execute = vim.api.nvim_command
-- local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
--
-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--   execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
-- end
local packer=require'packer'
local use=packer.use
return packer.startup(function()

	--use("vim-scripts/loremipsum")

	use("mikelue/vim-maven-plugin")
	use("wbthomason/packer.nvim")

	-- colorschemes
	-- tmux helpers
	use("christoomey/vim-tmux-navigator")
	use("tmux-plugins/vim-tmux")
	use("preservim/vimux")

	-- helpers
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	-- use("stephpy/vim-yaml")
	use("haringsrob/nvim_context_vt")
	-- use("https://github.com/airblade/vim-rooter")
	-- use("raimondi/delimitmate")
	--
	-- completion
	use("hrsh7th/nvim-compe")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")

	use("hrsh7th/cmp-nvim-lua")
	use("honza/vim-snippets")
	use("hrsh7th/cmp-buffer")
	use("SirVer/ultisnips")

	use({ "saadparwaiz1/cmp_luasnip" })
	use("onsails/lspkind-nvim")
	use("L3MON4D3/LuaSnip")
	-- use'https://github.com/hrsh7th/cmp-nvim-lsp'
	-- use("nvim-treesitter/completion-treesitter")
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")
	use("glepnir/lspsaga.nvim")
	use("nvim-telescope/telescope.nvim")
	--
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- use("jvgrootveld/telescope-zoxide")
	-- use("https://github.com/camgraff/telescope-tmux.nvim")
	use("nvim-telescope/telescope-project.nvim")
	use("nvim-telescope/telescope-frecency.nvim")
	use("nvim-telescope/telescope-packer.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	--
	-- use 'pocco81/dapinstall.nvim'
	use("tami5/sql.nvim")
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
	use("tpope/vim-fugitive")
	-- use({ "ray-x/lsp_signature.nvim",config=require "lsp_signature".setup()
	-- })
	--
	-- use("nacro90/numb.nvim")
	-- use("tpope/vim-dispatch")
	-- use("nvim-lua/lsp_extensions.nvim")
	-- use 'tpope/vim-eunuch'
	use("tpope/vim-surround")
	-- use 'tpope/vim-obsession'
	-- use 'tpope/vim-unimpaired'
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use("folke/lsp-trouble.nvim")
	-- use("liuchengxu/vista.vim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	--
	use({ "nvim-treesitter/playground", opt = true })
	-- use("justinmk/vim-gtfo")
	use("neovim/nvim-lspconfig")
	-- use("romainl/vim-qf")
	-- use("simrat39/rust-tools.nvim")
	-- use({ "prettier/vim-prettier", run = "yarn install" })
	-- use("https://github.com/rrethy/vim-illuminate")
	-- use("yggdroot/indentline")
	-- use("https://github.com/alx741/vim-rustfmt")
	-- use("luochen1990/rainbow")
	use("junegunn/rainbow_parentheses.vim")
	-- use("nvie/vim-flake8")
	-- use("maxmellon/vim-jsx-pretty")

	-- use("https://github.com/szw/vim-maximizer")
	-- use("xolox/vim-misc")
	-- use("AndrewRadev/tagalong.vim")
	-- use("godlygeek/tabular")
	-- use("plasticboy/vim-markdown")
	-- use("voldikss/vim-floaterm")
	-- use("Chiel92/vim-autoformat")
	use("sbdchd/neoformat")
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
	-- use 'xolox/vim-misc'
	-- use("tbastos/vim-lua")
	-- use("lfilho/cosco.vim")
	use("preservim/nerdcommenter")
	-- use 'junegunn/fzf.vim'
	-- use 'chiefnoah/neuron-v2.vim'
	-- use("w0rp/ale")
	use("mhinz/vim-startify")
	-- use 'ianks/vim-tsx'
	-- use 'rbgrouleff/bclose.vim'
	use("jiangmiao/auto-pairs")
	-- use("jbyuki/venn.nvim")
	-- use({ "vhyrro/neorg", requires = "nvim-lua/plenary.nvim" })
	-- use("mfussenegger/nvim-jdtls")
	--
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	--
	use({ "folke/lua-dev.nvim" })
	use({
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	})
	--
	-- use({
	-- "ThePrimeagen/refactoring.nvim",
	-- requires = {
	-- { "nvim-lua/plenary.nvim" },
	-- { "nvim-treesitter/nvim-treesitter" },
	-- },
	-- })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})

			require("nvim-autopairs.completion.compe").setup({
				map_cr = true, --  map <CR> on insert mode
				map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
				auto_select = false, -- auto select first item
				map_char = { -- modifies the function or method delimiter by filetypes
					all = "(",
					tex = "{",
				},
			})
		end,
	})

	-- use({ "tamago324/lir.nvim" })
	use("ThePrimeagen/harpoon")
	use("ThePrimeagen/git-worktree.nvim")
	--
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")
	use("mbbill/undotree")
	use("tpope/vim-scriptease")
	use("ggandor/lightspeed.nvim")
	use("kshenoy/vim-signature")
	use("mattn/emmet-vim")
	-- use{"alvan/vim-closetag",config=require('nvim-ts-autotag').setup()
	use({ "windwp/nvim-ts-autotag", config = require("nvim-ts-autotag").setup() })

	-- Lua
	use({
		"ahmedkhalf/lsp-rooter.nvim",
		config = function()
			require("lsp-rooter").setup({})
		end,
	})
end)
