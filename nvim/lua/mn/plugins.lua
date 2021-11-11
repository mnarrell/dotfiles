return require("packer").startup {
	function(use)
		use { "wbthomason/packer.nvim" }

		-- Eyecandy
		-- use {'norcalli/nvim-base16.lua', config = function() require('plugins.norcalli-theme') end}
		use { "RRethy/nvim-base16" }
		use {
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		}
		use { "fweep/vim-tabber" }
		use { "kshenoy/vim-signature" }
		use { "machakann/vim-highlightedyank" }
		use { "glepnir/galaxyline.nvim" }
		use { "kyazdani42/nvim-web-devicons" }
		-- use {'ryanoasis/vim-devicons'}

		use {
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		}

		-- Basics
		use { "tpope/vim-commentary" }
		use { "tpope/vim-eunuch" }
		use { "tpope/vim-repeat" }
		use { "tpope/vim-surround" }
		use { "tpope/vim-unimpaired" }
		use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }
		use { "tpope/vim-scriptease", cmd = {
			"Messages",
			"Verbose",
		} }
		use { "wincent/loupe" }
		use { "romainl/vim-qf" }

		-- Navigation
		use { "jlanzarotta/bufexplorer" }
		use { "gennaro-tedesco/nvim-peekup" }
		use { "markonm/traces.vim" }
		use { "godlygeek/tabular" }
		use { "AndrewRadev/splitjoin.vim" }
		use { "tpope/vim-vinegar" }
		use {
			"unblevable/quick-scope",
			config = function()
				vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
			end,
		}
		use { "simeji/winresizer" }

		-- Text objects
		use { "kana/vim-textobj-user" }
		use { "christoomey/vim-sort-motion" }
		use { "kana/vim-textobj-indent" }
		use { "wellle/targets.vim" }

		-- Git
		use { "tpope/vim-fugitive" }
		use { "lewis6991/gitsigns.nvim" }

		-- Tmux
		use { "edkolev/tmuxline.vim", disable = true }
		use { "tmux-plugins/vim-tmux", opt = true, ft = "tmux" }
		use { "tmux-plugins/vim-tmux-focus-events" }

		-- Completion
		-- use { "honza/vim-snippets" }
		use { "honza/vim-snippets", rtp = "." }
		use { "SirVer/ultisnips" }
		-- use { "nvim-lua/completion-nvim" }
		use { "hrsh7th/nvim-cmp" }
		use { "hrsh7th/cmp-nvim-lsp" }
		use { "quangnguyen30192/cmp-nvim-ultisnips" }

		-- Linting
		use { "dense-analysis/ale" }

		-- Syntax {{{
		use { "fatih/vim-go", run = ":GoUpdateBinaries", opt = true, ft = "go" }

		use { "raimon49/requirements.txt.vim", opt = true, ft = "requirements" }
		use {
			"vim-python/python-syntax",
			opt = true,
			ft = "python",
			config = function()
				vim.g.python_highlight_all = 1
			end,
		}
		use { "cespare/vim-toml", opt = true, ft = "toml" }
		use { "chr4/nginx.vim", opt = true, ft = "nginx" }
		use { "hashivim/vim-terraform", opt = true, ft = { "terraform", "hcl" } }
		-- use { "jvirtanen/vim-hcl" }
		use { "pearofducks/ansible-vim", run = "cd ./UltiSnips; ./generate.py" }
		use { "towolf/vim-helm", ft = "helm" }
		-- use {'plasticboy/vim-markdown', ft = 'markdown'}

		use { "folke/lua-dev.nvim" }
		use { "euclidianAce/BetterLua.vim", opt = true, ft = "lua" }
		use { "ckipp01/stylua-nvim", opt = true, ft = "lua" }
		-- }}}

		use { "pedrohdz/vim-yaml-folds" }

		-- Treesitter
		use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
		-- use {'windwp/nvim-ts-autotag', config = function() require('nvim-ts-autotag').setup() end}
		use { "nvim-treesitter/nvim-treesitter-textobjects" }
		use { "nvim-treesitter/nvim-treesitter-refactor" }

		-- LSP
		use { "neovim/nvim-lspconfig" }
		use { "onsails/lspkind-nvim" }

		-- FZF
		use { "junegunn/fzf" }
		use { "junegunn/fzf.vim" }

		-- Telescope {{{
		use {
			"nvim-lua/telescope.nvim",
			requires = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
			},
			config = function()
				require "mn.telescope"
			end,
		}

		use { "nvim-telescope/telescope-packer.nvim" }
		use { "nvim-telescope/telescope-symbols.nvim" }

		use { "fhill2/telescope-ultisnips.nvim" }
		-- }}}

		use {
			"folke/trouble.nvim",
			-- cmd = { "LspTrouble", "TroubleToggle" },
			-- event = "BufRead",
			config = function()
				require("trouble").setup { height = 20 }
			end,
		}

		use {
			"folke/todo-comments.nvim",
			config = function()
				require("todo-comments").setup()
			end,
		}
	end,
	config = { display = {
		open_fn = require("packer.util").float,
	} },
}