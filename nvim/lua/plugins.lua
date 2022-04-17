local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'lewis6991/impatient.nvim'

    -- Vim Enhancements
    use 'airblade/vim-rooter'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'wakatime/vim-wakatime'
    use { 'windwp/nvim-autopairs', config = function() require 'nvim-autopairs'.setup {} end, }

    -- Gui enhancements
    use 'preservim/nerdtree'
    use { 'karb94/neoscroll.nvim', config = function()
    end }
    use 'andymass/vim-matchup'
    use 'p00f/nvim-ts-rainbow'
    use 'airblade/vim-gitgutter'
    use 'f-person/git-blame.nvim'
    use { 'j-hui/fidget.nvim', config = function() require 'fidget'.setup({}) end, }
    use {
        'nvim-lualine/lualine.nvim',
        after = "onedark.nvim",
        config = function() require 'lualine'.setup({
                options = {
                    theme = 'onedark',
                    path = 1,
                    globalstatus = true,
                }
            })
        end,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    use { 'jrmoulton/onedark.nvim', config = function() require 'onedark'.setup({
            functionStyle = "italic",
            commentStyle = "NONE",
            transparent = true,

        })
    end,
    }
    use {
        'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end,
    }
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use 'gelguy/wilder.nvim'
    use {
        'AckslD/nvim-neoclip.lua',
        config = function()
            require('neoclip').setup()
        end,
    }
    -- use "lukas-reineke/indent-blankline.nvim"

    -- Semantic language support
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'ray-x/lsp_signature.nvim'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'pwntester/octo.nvim', config = function()
        require "octo".setup()
    end }
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'tami5/sqlite.lua'
    use 'nvim-telescope/telescope-cheat.nvim'

    -- Syntactic language support
    use 'cespare/vim-toml'
    use 'stephpy/vim-yaml'
    use 'mfussenegger/nvim-jdtls'
    use 'rhysd/vim-clang-format'
    use 'godlygeek/tabular'
    use 'plasticboy/vim-markdown'
    use 'jakewvincent/texmagic.nvim'
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'
    use 'vim-python/python-syntax'
    use 'hunger/vim-slint'
    use 'p00f/clangd_extensions.nvim'

    -- Debugger
    use {
        'mfussenegger/nvim-dap'
    }
    use { 'theHamsta/nvim-dap-virtual-text', config = function() require("nvim-dap-virtual-text").setup() end, }
    use { 'nvim-telescope/telescope-dap.nvim', config = function() require('telescope').load_extension('dap') end, }
    use 'mfussenegger/nvim-dap-python'
    use 'jbyuki/one-small-step-for-vimkind'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
        require('packer').sync()
    end
end)
