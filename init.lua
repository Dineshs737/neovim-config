-- ================================================================================================
-- MODERN NEOVIM CONFIGURATION FOR WEB & BACKEND DEVELOPMENT
-- ================================================================================================
-- This configuration provides a complete IDE-like experience for modern development
-- Supports: JS/TS, React, Node.js, Python, Go, Java, PHP, C++, Rust, and more
-- Platform: Linux, Windows, macOS compatible
-- Enhanced with better file and folder icons
-- ================================================================================================

-- ================================================================================================
-- BOOTSTRAP LAZY.NVIM PLUGIN MANAGER
-- ================================================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ================================================================================================
-- BASIC VIM SETTINGS
-- ================================================================================================
-- Leader key configuration (must be set before lazy setup)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Essential settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase present
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.wrap = true -- Don't wrap lines
vim.o.linebreak = true -- breaks at word boundary instead of middle of word
vim.o.breakindent = true -- keeps indentation when wrapped
vim.opt.breakindent = true -- Preserve indent on wrapped lines
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true -- Auto indent new lines
vim.opt.smartindent = true -- Smart indentation
vim.opt.cursorline = true -- Highlight current line
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster key sequence completion
vim.opt.splitright = true -- Vertical splits to the right
vim.opt.splitbelow = true -- Horizontal splits below
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Undo settings
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- ================================================================================================
-- PLUGIN CONFIGURATION WITH LAZY.NVIM
-- ================================================================================================
require("lazy").setup({

	-- ============================================================================================
	-- COLORSCHEME & UI
	-- ============================================================================================
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				show_end_of_buffer = false,
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
					mason = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- Enhanced Icons Configuration
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				-- Globally enable different icons for directories
				override_by_filename = {
					[".gitignore"] = {
						icon = "",
						color = "#f1502f",
						name = "Gitignore",
					},
					["Dockerfile"] = {
						icon = "󰡨",
						color = "#2496ED",
						name = "Dockerfile",
					},
					["docker-compose.yml"] = {
						icon = "󰡨",
						color = "#2496ED",
						name = "DockerCompose",
					},
					["package.json"] = {
						icon = "",
						color = "#e8274b",
						name = "PackageJson",
					},
					["package-lock.json"] = {
						icon = "",
						color = "#cb3837",
						name = "PackageLockJson",
					},
					["yarn.lock"] = {
						icon = "",
						color = "#2C8EBB",
						name = "YarnLock",
					},
					["README.md"] = {
						icon = "",
						color = "#42a5f5",
						name = "Readme",
					},
					["LICENSE"] = {
						icon = "",
						color = "#cbcb41",
						name = "License",
					},
					[".env"] = {
						icon = "",
						color = "#faf743",
						name = "Env",
					},
					[".env.local"] = {
						icon = "",
						color = "#faf743",
						name = "EnvLocal",
					},
					["tsconfig.json"] = {
						icon = "",
						color = "#519aba",
						name = "TsConfig",
					},
					["tailwind.config.js"] = {
						icon = "󱏿",
						color = "#38bdf8",
						name = "TailwindConfig",
					},
					["next.config.js"] = {
						icon = "",
						color = "#000000",
						name = "NextConfig",
					},
					["vite.config.js"] = {
						icon = "",
						color = "#646CFF",
						name = "ViteConfig",
					},
					["webpack.config.js"] = {
						icon = "󰜬",
						color = "#8DD6F9",
						name = "WebpackConfig",
					},
				},
				override_by_extension = {
					-- JavaScript/TypeScript
					["js"] = {
						icon = "",
						color = "#f7df1e",
						name = "Js",
					},
					["ts"] = {
						icon = "",
						color = "#519aba",
						name = "Ts",
					},
					["jsx"] = {
						icon = "",
						color = "#61dafb",
						name = "Jsx",
					},
					["tsx"] = {
						icon = "",
						color = "#61dafb",
						name = "Tsx",
					},
					-- Web Development
					["html"] = {
						icon = "",
						color = "#e44d26",
						name = "Html",
					},
					["css"] = {
						icon = "",
						color = "#1572b6",
						name = "Css",
					},
					["scss"] = {
						icon = "",
						color = "#CF649A",
						name = "Scss",
					},
					["sass"] = {
						icon = "",
						color = "#CF649A",
						name = "Sass",
					},
					["vue"] = {
						icon = "",
						color = "#4FC08D",
						name = "Vue",
					},
					["svelte"] = {
						icon = "",
						color = "#ff3e00",
						name = "Svelte",
					},
					-- Backend Languages
					["py"] = {
						icon = "",
						color = "#3776ab",
						name = "Python",
					},
					["go"] = {
						icon = "",
						color = "#00ADD8",
						name = "Go",
					},
					["rs"] = {
						icon = "",
						color = "#dea584",
						name = "Rust",
					},
					["java"] = {
						icon = "",
						color = "#f89820",
						name = "Java",
					},
					["php"] = {
						icon = "",
						color = "#777BB4",
						name = "Php",
					},
					["cpp"] = {
						icon = "",
						color = "#00599C",
						name = "Cpp",
					},
					["c"] = {
						icon = "",
						color = "#A8B9CC",
						name = "C",
					},
					-- Data & Config
					["json"] = {
						icon = "",
						color = "#cbcb41",
						name = "Json",
					},
					["yaml"] = {
						icon = "",
						color = "#cc0000",
						name = "Yaml",
					},
					["yml"] = {
						icon = "",
						color = "#cc0000",
						name = "Yml",
					},
					["toml"] = {
						icon = "",
						color = "#9c4221",
						name = "Toml",
					},
					["xml"] = {
						icon = "",
						color = "#e37933",
						name = "Xml",
					},
					-- Database
					["sql"] = {
						icon = "",
						color = "#336791",
						name = "Sql",
					},
					["db"] = {
						icon = "",
						color = "#dad8d8",
						name = "Database",
					},
					-- Images
					["png"] = {
						icon = "",
						color = "#a074c4",
						name = "Png",
					},
					["jpg"] = {
						icon = "",
						color = "#a074c4",
						name = "Jpg",
					},
					["jpeg"] = {
						icon = "",
						color = "#a074c4",
						name = "Jpeg",
					},
					["gif"] = {
						icon = "",
						color = "#a074c4",
						name = "Gif",
					},
					["svg"] = {
						icon = "",
						color = "#a074c4",
						name = "Svg",
					},
					-- Documents
					["md"] = {
						icon = "",
						color = "#519aba",
						name = "Markdown",
					},
					["pdf"] = {
						icon = "",
						color = "#b30b00",
						name = "Pdf",
					},
					["txt"] = {
						icon = "",
						color = "#89e051",
						name = "Txt",
					},
					-- Archives
					["zip"] = {
						icon = "",
						color = "#f7df1e",
						name = "Zip",
					},
					["tar"] = {
						icon = "",
						color = "#f7df1e",
						name = "Tar",
					},
					["gz"] = {
						icon = "",
						color = "#f7df1e",
						name = "Gz",
					},
					-- Shell scripts
					["sh"] = {
						icon = "",
						color = "#89e051",
						name = "Shell",
					},
					["bash"] = {
						icon = "",
						color = "#89e051",
						name = "Bash",
					},
					["zsh"] = {
						icon = "",
						color = "#89e051",
						name = "Zsh",
					},
					-- Other
					["lua"] = {
						icon = "",
						color = "#51a0cf",
						name = "Lua",
					},
					["vim"] = {
						icon = "",
						color = "#019833",
						name = "Vim",
					},
					["log"] = {
						icon = "",
						color = "#afcb85",
						name = "Log",
					},
				},
				override_by_operating_system = {
					["apple"] = {
						icon = "",
						color = "#A2AAAD",
						cterm_color = "248",
						name = "Apple",
					},
					["linux"] = {
						icon = "",
						color = "#F8C52C",
						cterm_color = "220",
						name = "Linux",
					},
					["windows"] = {
						icon = "",
						color = "#00A4EF",
						cterm_color = "39",
						name = "Windows",
					},
				},
				color_icons = true,
				default = true,
				strict = true,
			})
		end,
	},

	-- ============================================================================================
	-- FILE EXPLORER - ENHANCED WITH BETTER ICONS
	-- ============================================================================================
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Define diagnostic signs before nvim-tree setup
			local signs = {
				Error = "✘",
				Warn = "▲",
				Hint = "⚑",
				Info = "ℹ",
			}

			-- Define the diagnostic signs that nvim-tree expects
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })

				-- Also define the nvim-tree specific signs
				local nvim_tree_hl = "NvimTreeDiagnostic" .. type .. "Icon"
				vim.fn.sign_define(nvim_tree_hl, { text = icon, texthl = hl, numhl = hl })
			end

			require("nvim-tree").setup({
				disable_netrw = true,
				hijack_netrw = true,
				view = {
					width = 40, -- Increased width to accommodate icons
					side = "left",
				},
				renderer = {
					add_trailing = false,
					group_empty = true, -- Group empty folders
					highlight_git = true, -- Highlight git status
					highlight_opened_files = "icon",
					root_folder_modifier = ":~",
					indent_markers = {
						enable = true, -- Enable indent markers for better structure
						icons = {
							corner = "└",
							edge = "│",
							item = "│",
							bottom = "─",
							none = " ",
						},
					},
					icons = {
						webdev_colors = true,
						git_placement = "before",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							default = "",
							symlink = "",
							bookmark = "󰃃",
							modified = "●",
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					},
					special_files = {
						"Cargo.toml",
						"Makefile",
						"README.md",
						"readme.md",
						"package.json",
						"composer.json",
						"go.mod",
						"requirements.txt",
						"Dockerfile",
						"docker-compose.yml",
						".env",
						".gitignore",
						"LICENSE",
						"tsconfig.json",
						"webpack.config.js",
						"vite.config.js",
						"next.config.js",
						"tailwind.config.js",
					},
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true, -- Show diagnostics on directories
					show_on_open_dirs = true,
					debounce_delay = 50,
					severity = {
						min = vim.diagnostic.severity.HINT,
						max = vim.diagnostic.severity.ERROR,
					},
					icons = {
						hint = "⚑",
						info = "ℹ",
						warning = "▲",
						error = "✘",
					},
				},
				filters = {
					dotfiles = false,
					git_clean = false,
					no_buffer = false,
					custom = {
						"node_modules",
						"\\.cache",
						"\\.git$",
						"__pycache__",
						"*.pyc",
						"*.pyo",
						"*.egg-info",
						".pytest_cache",
						".coverage",
						"dist",
						"build",
						"target",
						"*.class",
						"*.jar",
						"*.war",
						"*.ear",
					},
					exclude = {},
				},
				git = {
					enable = true,
					ignore = false, -- Show ignored files
					timeout = 400,
					show_on_dirs = true,
					show_on_open_dirs = true,
				},
				actions = {
					use_system_clipboard = true,
					change_dir = {
						enable = true,
						global = false,
						restrict_above_cwd = false,
					},
					expand_all = {
						max_folder_discovery = 300,
						exclude = { ".git", "target", "build", "node_modules" },
					},
					file_popup = {
						open_win_config = {
							col = 1,
							row = 1,
							relative = "cursor",
							border = "shadow",
							style = "minimal",
						},
					},
					open_file = {
						quit_on_open = false,
						resize_window = true,
						window_picker = {
							enable = true,
							picker = "default",
							chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
							exclude = {
								filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
								buftype = { "nofile", "terminal", "help" },
							},
						},
					},
					remove_file = {
						close_window = true,
					},
				},
				trash = {
					cmd = "gio trash",
					require_confirm = true,
				},
				live_filter = {
					prefix = "[FILTER]: ",
					always_show_folders = true,
				},
				tab = {
					sync = {
						open = false,
						close = false,
						ignore = {},
					},
				},
				notify = {
					threshold = vim.log.levels.INFO,
				},
				ui = {
					confirm = {
						remove = true,
						trash = true,
					},
				},
				experimental = {
					actions = {
						open_file = {
							relative_path = false,
						},
					},
				},
			})

			-- Enhanced folder and file highlighting
			vim.cmd([[
				hi NvimTreeFolderIcon guifg=#89b4fa
				hi NvimTreeFolderName guifg=#89b4fa
				hi NvimTreeOpenedFolderName guifg=#89b4fa gui=bold
				hi NvimTreeEmptyFolderName guifg=#6c7086
				hi NvimTreeExecFile guifg=#a6e3a1 gui=bold
				hi NvimTreeSpecialFile guifg=#f9e2af gui=underline
				hi NvimTreeSymlink guifg=#94e2d5
				hi NvimTreeRootFolder guifg=#fab387 gui=bold
				hi NvimTreeImageFile guifg=#eba0ac
				hi NvimTreeMarkdownFile guifg=#89dceb
			]])
		end,
	},

	-- ============================================================================================
	-- TELESCOPE - FUZZY FINDER
	-- ============================================================================================
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"%.git/",
						"%.DS_Store",
						"target/",
						"build/",
						"%.o",
						"%.a",
						"%.out",
						"%.class",
						"%.pdf",
						"%.mkv",
						"%.mp4",
						"%.zip",
					},
				},
			})

			-- Enable telescope fzf native
			pcall(require("telescope").load_extension, "fzf")
		end,
	},

	-- ============================================================================================
	-- TREESITTER - SYNTAX HIGHLIGHTING
	-- ============================================================================================
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"lua",
					"python",
					"rust",
					"tsx",
					"javascript",
					"typescript",
					"vimdoc",
					"vim",
					"bash",
					"html",
					"css",
					"json",
					"yaml",
					"toml",
					"markdown",
					"markdown_inline",
					"java",
					"php",
					"prisma",
					"graphql",
					"dockerfile",
					"sql",
					"gitignore",
					"jsdoc",
					"scss",
					"vue",
					"svelte",
				},
				auto_install = false, -- Changed to false to avoid conflicts
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<M-space>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
				},
			})
		end,
	},

	-- ============================================================================================
	-- LSP CONFIGURATION
	-- ============================================================================================
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Web Development
					"ts_ls", -- TypeScript/JavaScript (updated from tsserver)
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS
					"emmet_ls", -- Emmet
					"jsonls", -- JSON
					-- Backend
					"pyright", -- Python
					"gopls", -- Go
					"rust_analyzer", -- Rust
					"jdtls", -- Java
					"intelephense", -- PHP
					"clangd", -- C/C++
					-- Config/Data
					"lua_ls", -- Lua
					"yamlls", -- YAML
					"dockerls", -- Docker
					"prismals", -- Prisma
				},
				automatic_installation = true,
			})

			-- LSP settings
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configure each language server
			local servers = {
				tsserver = {},
				html = { filetypes = { "html", "twig", "hbs" } },
				cssls = {},
				tailwindcss = {},
				emmet_ls = {},
				jsonls = {},
				pyright = {},
				gopls = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
				jdtls = {},
				intelephense = {},
				clangd = {},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = { enable = false },
						},
					},
				},
				yamlls = {},
				dockerls = {},
				prismals = {},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end
		end,
	},

	-- ============================================================================================
	-- AUTOCOMPLETION
	-- ============================================================================================
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source
			"hrsh7th/cmp-buffer", -- Buffer source
			"hrsh7th/cmp-path", -- Path source
			"hrsh7th/cmp-cmdline", -- Cmdline source
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- Snippet source
			"rafamadriz/friendly-snippets", -- VS Code like snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load VS Code style snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = function(entry, vim_item)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
			})

			-- Command line completion
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},

	-- ============================================================================================
	-- FORMATTING & LINTING - Using conform.nvim and nvim-lint
	-- ============================================================================================
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					-- JavaScript/TypeScript
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					-- Web
					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					-- Backend
					python = { "black" },
					go = { "goimports", "gofmt" },
					rust = { "rustfmt" },
					-- Config
					lua = { "stylua" },
					-- Systems
					c = { "clang_format" },
					cpp = { "clang_format" },
					-- PHP
					php = { "phpcbf" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "flake8" },
				php = { "phpcs" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			-- Fixed: Changed "BufEnterPost" to "BufEnter"
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- ============================================================================================
	-- GIT INTEGRATION
	-- ============================================================================================
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 1000,
					ignore_whitespace = false,
				},
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				max_file_length = 40000,
				preview_config = {
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},

	-- ============================================================================================
	-- COMMENTING
	-- ============================================================================================
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				opleader = {
					line = "gc",
					block = "gb",
				},
				extra = {
					above = "gcO",
					below = "gco",
					eol = "gcA",
				},
				mappings = {
					basic = true,
					extra = true,
				},
				pre_hook = nil,
				post_hook = nil,
			})
		end,
	},

	-- ============================================================================================
	-- ADDITIONAL PRODUCTIVITY PLUGINS
	-- ============================================================================================

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})

			-- Integration with nvim-cmp
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Surround text objects
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Better terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "┊",
					tab_char = "┊",
				},
				scope = { enabled = false },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"Trouble",
						"lazy",
						"mason",
					},
				},
			})
		end,
	},

	-- Which key - show keybindings
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
})

-- ================================================================================================
-- KEY MAPPINGS
-- ================================================================================================

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- File explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { desc = "Find current file in tree" })
vim.keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>", { desc = "Refresh file tree" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find references" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols" })

-- LSP
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
vim.keymap.set("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move text up and down
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Git signs
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle blame" })

-- ================================================================================================
-- AUTOCOMMANDS
-- ================================================================================================

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Auto format on save (using conform.nvim)
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			async = false,
			lsp_fallback = true,
		})
	end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

-- ================================================================================================
-- LSP DIAGNOSTIC CONFIGURATION
-- ================================================================================================
vim.diagnostic.config({
	virtual_text = {
		enabled = true,
		prefix = "●",
		source = "if_many",
		format = function(diagnostic)
			-- Show source and message
			local source = diagnostic.source and string.format("[%s] ", diagnostic.source) or ""
			return string.format("%s%s", source, diagnostic.message)
		end,
		severity = {
			min = vim.diagnostic.severity.HINT,
		},
	},
	signs = {
		severity = {
			min = vim.diagnostic.severity.HINT,
		},
	},
	underline = {
		severity = {
			min = vim.diagnostic.severity.HINT,
		},
	},
	update_in_insert = true, -- Changed to true for real-time feedback
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		format = function(diagnostic)
			return string.format("%s (%s)", diagnostic.message, diagnostic.source or "LSP")
		end,
	},
})

-- Enhanced diagnostic signs with better icons
local signs = {
	Error = "✘",
	Warn = "▲",
	Hint = "⚑",
	Info = "ℹ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- ================================================================================================
-- CONFIGURATION COMPLETE
-- ================================================================================================
-- Save and restart Neovim, then run :Lazy sync to install all plugins
-- After installation, run :Mason to install additional LSP servers if needed
-- Use :checkhealth to verify everything is working correctly
-- ================================================================================================
