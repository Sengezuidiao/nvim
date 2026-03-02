return {
	"Civitasv/cmake-tools.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		-- 如果你要用 toggleterm / overseer 才需要加
		-- "akinsho/toggleterm.nvim",
		-- "stevearc/overseer.nvim",
	},

	opts = function()
		local osys = require("cmake-tools.osys")

		return {
			cmake_command = "cmake",
			ctest_command = "ctest",

			cmake_use_preset = true,
			cmake_regenerate_on_save = true,

			cmake_generate_options = {
				"-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
			},

			cmake_build_options = {},

			cmake_build_directory = function()
				if osys.iswin32 then
					return "out\\${variant:buildType}"
				end
				return "out/${variant:buildType}"
			end,

			cmake_compile_commands_options = {
				action = "soft_link",
				target = vim.loop.cwd(),
			},

			cmake_kits_path = nil,

			cmake_variants_message = {
				short = { show = true },
				long = { show = true, max_length = 40 },
			},

			cmake_dap_configuration = {
				name = "cpp",
				type = "codelldb",
				request = "launch",
				stopOnEntry = false,
				runInTerminal = true,
				console = "integratedTerminal",
			},

			cmake_executor = {
				name = "quickfix",
			},

			cmake_runner = {
				name = "terminal",
			},

			cmake_notifications = {
				runner = { enabled = true },
				executor = { enabled = true },
				spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
				refresh_rate_ms = 100,
			},

			cmake_virtual_text_support = true,
			cmake_use_scratch_buffer = false,
		}
	end,
}
