local ok, packer = pcall(require, "packer")
if not ok then
	vim.notify("Unable to load packer", vim.log.levels.ERROR)
	return
end

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "PackerCompile",
	pattern = "*/mn/plugins.lua",
	group = vim.api.nvim_create_augroup("packer", { clear = true }),
})

packer.startup {
	function(use)
		use { "wbthomason/packer.nvim" }
		use { "nvim-lua/plenary.nvim" }

		-- Eyecandy
		use { "RRethy/nvim-base16" }
		use {
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		}
		use { "fweep/vim-tabber" }
		use { "kshenoy/vim-signature" } -- show marks
		use { "nvim-lualine/lualine.nvim" }
		use { "kyazdani42/nvim-web-devicons" }
		use { "windwp/nvim-autopairs" }

		use { "MunifTanjim/nui.nvim" }

		-- Basics
		use { "tpope/vim-abolish" }
		use { "tpope/vim-commentary" }
		use { "tpope/vim-eunuch" }
		use { "tpope/vim-repeat" }
		use { "tpope/vim-surround" }
		use { "tpope/vim-unimpaired" }
		use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }
		use { "tpope/vim-scriptease", cmd = { "Messages", "Verbose" } }
		use { "wincent/loupe" }
		use { "romainl/vim-qf" }

		-- Navigation
		use {
			"jlanzarotta/bufexplorer",
			setup = function()
				vim.g.bufExplorerDisableDefaultKeyMapping = 1
			end,
		}
		use { "gennaro-tedesco/nvim-peekup" }
		use { "markonm/traces.vim" }
		use { "godlygeek/tabular" }
		use { "AndrewRadev/splitjoin.vim" }
		use { "tpope/vim-vinegar" }
		use { "simeji/winresizer" }
		use { "johmsalas/text-case.nvim" }

		-- Text objects
		use { "kana/vim-textobj-user" }
		use { "christoomey/vim-sort-motion" }
		use { "kana/vim-textobj-indent" }
		use { "wellle/targets.vim" }

		-- Git
		use { "tpope/vim-rhubarb" }
		use { "tpope/vim-fugitive" }
		use { "lewis6991/gitsigns.nvim" }
		use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }

		-- Tmux
		use { "edkolev/tmuxline.vim", disable = true }
		use { "tmux-plugins/vim-tmux", opt = true, ft = "tmux" }
		use { "tmux-plugins/vim-tmux-focus-events" }
		use { "ojroques/vim-oscyank" }

		-- Completion
		use { "hrsh7th/nvim-cmp" }
		use { "hrsh7th/cmp-nvim-lsp" }
		use { "hrsh7th/cmp-nvim-lua" }
		use { "hrsh7th/cmp-path" }
		use { "hrsh7th/cmp-buffer" }
		use { "saadparwaiz1/cmp_luasnip" }
		use { "hrsh7th/cmp-nvim-lsp-signature-help" }
		use { "hrsh7th/cmp-omni" }
		use { "hrsh7th/cmp-nvim-lsp-document-symbol" }
		use { "andersevenrud/cmp-tmux" }

		-- Snippets
		-- use { "honza/vim-snippets", rtp = "." }
		use { "L3MON4D3/LuaSnip" }

		-- Linting
		use { "jose-elias-alvarez/null-ls.nvim" }

		-- Syntax {{{
		use { "fatih/vim-go", run = ":GoUpdateBinaries", opt = true, ft = "go" }
		use { "cespare/vim-toml", opt = true, ft = "toml" }
		use { "chr4/nginx.vim", opt = true, ft = "nginx" }
		use { "hashivim/vim-terraform", opt = true, ft = { "terraform", "hcl" } }
		use { "pearofducks/ansible-vim" }

		use { "folke/neodev.nvim" }
		use { "euclidianAce/BetterLua.vim", opt = true, ft = "lua" }
		-- }}}

		use { "pedrohdz/vim-yaml-folds" }

		-- Treesitter
		use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
		use {
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
			config = function()
				require("nvim-ts-autotag").setup()
			end,
		}
		use { "nvim-treesitter/nvim-treesitter-textobjects" }
		use { "nvim-treesitter/nvim-treesitter-refactor" }
		use { "p00f/nvim-ts-rainbow" }

		-- LSP
		use {
			"neovim/nvim-lspconfig",
			config = function()
				require "mn.lsp"
			end,
		}
		use { "onsails/lspkind-nvim" }

		use {
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup()
			end,
		}

		-- FZF
		use { "junegunn/fzf" }
		use { "junegunn/fzf.vim" }

		-- Telescope {{{
		use {
			"nvim-lua/telescope.nvim",
			requires = {
				{ "nvim-lua/popup.nvim" },
			},
			config = function()
				require "mn.telescope"
			end,
		}

		use { "nvim-telescope/telescope-packer.nvim" }
		use { "nvim-telescope/telescope-symbols.nvim" }

		use { "nvim-telescope/telescope-ui-select.nvim" }
		-- }}}

		use { "kevinhwang91/nvim-bqf", ft = "qf" }

		-- use { "rcarriga/nvim-notify", event = "BufEnter", }
		-- use { "rcarriga/nvim-notify" }

		-- use { "folke/trouble.nvim" }

		use {
			"folke/todo-comments.nvim",
			config = function()
				require("todo-comments").setup()
			end,
		}
	end,
	config = {
		display = { open_fn = require("packer.util").float },
		max_jobs = 10,
	},
}
