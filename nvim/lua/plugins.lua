local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input('Download Packer? (y for yes) ') ~= 'y' then return end

  local directory = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath('data'))
  vim.fn.mkdir(directory, 'p')
  local out = vim.fn.system(string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim',
                                          directory .. '/packer.nvim'))

  print(out)
  print('Downloading packer.nvim...')
  return
end

require('tools').create_autocmds({packer = {{'BufWritePost', 'plugins.lua', [[:PackerCompile]]}}})

return require('packer').startup({
  function(use)
    use {'wbthomason/packer.nvim', opt = true}

    -- Eyecandy
    use {'chriskempson/base16-vim', config = function() require('plugins.base16') end}
    use {'fweep/vim-tabber', config = function() require('plugins.tabber') end}
    use {'kshenoy/vim-signature'}
    use {'machakann/vim-highlightedyank'}
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}

    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim', config = function() require('plugins.fzf') end}

    -- use {'jiangmiao/auto-pairs'}
    use {'windwp/nvim-autopairs', config = function() require('plugins.autopairs') end}
    use {'tpope/vim-commentary', config = function() require('plugins.commentary') end}
    use {'tpope/vim-eunuch'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-unimpaired'}
    use {'tweekmonster/startuptime.vim', opt = true, cmd = 'StartupTime'}
    use {'tpope/vim-scriptease'}
    use {'wincent/loupe', config = function() require('plugins.loupe') end}

    -- Navigation
    use {'jlanzarotta/bufexplorer', config = function() require('plugins.bufexplorer') end}
    use {'junegunn/vim-peekaboo', config = function() vim.g.peekaboo_window = 'vertical botright 80new' end}
    use {'majutsushi/tagbar', config = function() require('plugins.tagbar') end}
    use {'markonm/traces.vim'}
    use {'tommcdo/vim-lion'}
    use {'godlygeek/tabular'}
    use {'AndrewRadev/splitjoin.vim'}
    use {'tpope/vim-vinegar'}
    use {'unblevable/quick-scope', config = function() vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'} end}

    -- Text objects
    use {'kana/vim-textobj-user'}
    use {'christoomey/vim-sort-motion'}
    use {'kana/vim-textobj-indent'}
    use {'wellle/targets.vim'}

    -- Git
    use {'mhinz/vim-signify', config = function() require('plugins.signify') end}
    use {'rhysd/git-messenger.vim'}
    use {'tpope/vim-fugitive', config = function() require('plugins.fugitive') end}

    -- Tmux
    use {'edkolev/tmuxline.vim', disable = true}
    use {'tmux-plugins/vim-tmux', opt = true, ft = 'tmux'}
    use {'tmux-plugins/vim-tmux-focus-events'}

    -- Completion
    use {'honza/vim-snippets'}
    use {'SirVer/ultisnips', config = function() require('plugins.ultisnips') end}
    use {'nvim-lua/completion-nvim', config = function() require('plugins.completion') end}

    -- Linting
    use {'dense-analysis/ale', config = function() require('plugins.ale') end}

    -- Syntax {{{
    use {'fatih/vim-go', config = require('plugins.golang'), run = ':GoUpdateBinaries'}

    use {'raimon49/requirements.txt.vim', opt = true, ft = 'requirements'}
    use {'vim-python/python-syntax', opt = true, ft = 'python', config = function() vim.g.python_highlight_all = 1 end}
    use {'cespare/vim-toml', opt = true, ft = 'toml'}
    use {'chr4/nginx.vim', opt = true, ft = 'nginx'}
    use {'hashivim/vim-terraform', config = function() require('plugins.vim-terraform') end}
    use {'pearofducks/ansible-vim', run = 'cd ./UltiSnips; ./generate.py'}
    -- use {'towolf/vim-helm', opt = true, ft = 'helm'}
    use {'towolf/vim-helm',  ft = 'helm'}
    -- }}}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('plugins.treesitter') end}
    -- use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/nvim-treesitter-refactor'}

    use {'neovim/nvim-lspconfig'}
    use {'glepnir/lspsaga.nvim', config = function() require('plugins.lspsaga') end}

    -- Telescope {{{
    use {
      'nvim-lua/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = function() require('plugins.telescope') end
    }
    use {'nvim-telescope/telescope-fzf-writer.nvim'}
    use {'nvim-telescope/telescope-fzy-native.nvim'}
    -- }}}

    -- use {'tjdevries/nlua.nvim'}

    use {'bfredl/nvim-luadev'}

    use {
      'kyazdani42/nvim-web-devicons',
      config = function() require('nvim-web-devicons').setup {} end,
      {'ryanoasis/vim-devicons'}
    }

    use {'euclidianAce/BetterLua.vim', {'andrejlevkovitch/vim-lua-format'}}
  end,
  config = {display = {open_fn = require('packer.util').float}}
})
