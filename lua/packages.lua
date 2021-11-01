local packer = require("packer")
local use = packer.use
return packer.startup(function()
	--use("vim-scripts/loremipsum")

	use({ "wbthomason/packer.nvim" })

	-- colorschemes
	-- tmux helpers
	use("christoomey/vim-tmux-navigator")
	use("tmux-plugins/vim-tmux")
	use("preservim/vimux")

	-- helpers
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	-- use("stephpy/vim-yaml")
	-- use("haringsrob/nvim_context_vt")
	use("https://github.com/airblade/vim-rooter")
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
	-- use("SirVer/ultisnips")
	use({ "saadparwaiz1/cmp_luasnip" })
	use("onsails/lspkind-nvim")
	use("L3MON4D3/LuaSnip")
	-- use("nvim-treesitter/completion-treesitter")
	use("rafamadriz/friendly-snippets")
	use("glepnir/lspsaga.nvim")

	-- telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- use("jvgrootveld/telescope-zoxide")
	-- use("https://github.com/camgraff/telescope-tmux.nvim")
	use("nvim-telescope/telescope-project.nvim")
	--use("nvim-telescope/telescope-frecency.nvim")
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "tami5/sqlite.lua" },
	})
	use("nvim-telescope/telescope-packer.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	--use("tami5/sql.nvim")
	-- use 'nvim-telescope/telescope-cheat.nvim'
	-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

	-- folke stuff
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	use("folke/lsp-colors.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use("folke/tokyonight.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use({
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})
	use("folke/lsp-trouble.nvim")
	use({ "folke/lua-dev.nvim" })

	--lsp
	--use({ "ray-x/lsp_signature.nvim", config = require("lsp_signature").setup() })
	-- use("nvim-lua/lsp_extensions.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("neovim/nvim-lspconfig")
	use("mfussenegger/nvim-jdtls")
	-- use("simrat39/rust-tools.nvim")
	use("kshenoy/vim-signature")
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			local opts = {
				-- whether to highlight the currently hovered symbol
				-- disable if your cpu usage is higher than you want it
				-- or you just hate the highlight
				-- default: true
				highlight_hovered_item = true,

				-- whether to show outline guides
				-- default: true
				show_guides = true,
			}

			require("symbols-outline").setup(opts)
		end,
	})

	--tpope
	-- use 'tpope/vim-eunuch'
	-- use("tpope/vim-dispatch")
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	-- use 'tpope/vim-obsession'
	-- use 'tpope/vim-unimpaired'
	use("tpope/vim-scriptease")

	--dap
	--TODO need to set this up
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")

	--treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", opt = true })

	--other helpers
	use("junegunn/rainbow_parentheses.vim")
	use("sbdchd/neoformat")
	use("preservim/nerdcommenter")
	use("mhinz/vim-startify")
	-- use("jiangmiao/auto-pairs")
	use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	--use({ "rcarriga/nvim-notify", config = function() vim.notify = require("notify") end, })
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
	use({ "windwp/nvim-ts-autotag", config = require("nvim-ts-autotag").setup() })
	use("ThePrimeagen/harpoon")
	use("ThePrimeagen/git-worktree.nvim")
	--	use({ "mikelue/vim-maven-plugin", ft = { "java" } })
	use("mbbill/undotree")
	use("ggandor/lightspeed.nvim")
	use("mattn/emmet-vim")
	use({
		"beauwilliams/focus.nvim",
		cmd = { "FocusSplitNicely", "FocusSplitCycle" },
		module = "focus",
		config = function()
			require("focus").setup({ hybridnumber = true })

			local focusmap = function(direction)
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>" .. direction,
					":lua require'focus'.split_command('" .. direction .. "')<CR>",
					{ silent = true }
				)
			end
			-- Use `<Leader>h` to split the screen to the left, same as command FocusSplitLeft etc
			focusmap("h")
			focusmap("j")
			focusmap("k")
			focusmap("l")
			vim.api.nvim_set_keymap("n", "<c-g>", ":FocusSplitNicely<CR>", { silent = true })
		end,
	})
	use({
		"tjdevries/cyclist.vim",
		config = function()
			vim.cmd([[

nnoremap <leader>cn <Plug>CyclistNext
nnoremap <leader>cp <Plug>CyclistPrev
call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',    
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

call cyclist#add_listchar_option_set('busy', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',    
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

    ]])
		end,
	})
	--use({ "nacro90/numb.nvim", config = require("numb").setup() })

	--idk what these do
	-- use("romainl/vim-qf")
	-- use({ "prettier/vim-prettier", run = "yarn install" })
	-- use("https://github.com/rrethy/vim-illuminate")
	-- use("yggdroot/indentline")
	-- use("https://github.com/alx741/vim-rustfmt")
	-- use("luochen1990/rainbow")
	-- use("nvie/vim-flake8")
	-- use("maxmellon/vim-jsx-pretty")

	-- use("https://github.com/szw/vim-maximizer")
	-- use("xolox/vim-misc")
	-- use("AndrewRadev/tagalong.vim")
	-- use("godlygeek/tabular")
	-- use("plasticboy/vim-markdown")
	-- use("voldikss/vim-floaterm")
	-- use("Chiel92/vim-autoformat")
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
	-- use 'junegunn/fzf.vim'
	-- use 'chiefnoah/neuron-v2.vim'
	-- use("w0rp/ale")
	-- use 'ianks/vim-tsx'
	-- use 'rbgrouleff/bclose.vim'
	-- use("jbyuki/venn.nvim")
	-- use({ "vhyrro/neorg", requires = "nvim-lua/plenary.nvim" })
	--
	--
	--
	-- use({
	-- "ThePrimeagen/refactoring.nvim",
	-- requires = {
	-- { "nvim-lua/plenary.nvim" },
	-- { "nvim-treesitter/nvim-treesitter" },
	-- },
	-- })

	-- use({ "tamago324/lir.nvim" })

	-- Lua
end)
