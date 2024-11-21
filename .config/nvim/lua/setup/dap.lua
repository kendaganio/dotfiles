local function setup()
	local dap = require("dap")
	local dapui = require("dapui")

	dap.set_log_level("TRACE")

	dap.adapters.php = {
		type = "executable",
		command = "node",
		args = { os.getenv("HOME") .. "/PhpStormProjects/vscode-php-debug/out/phpDebug.js" },
	}

	dap.configurations.php = {
		{
			name = "Listen for Xdebug",
			type = "php",
			request = "launch",
			port = 9020,
			log = true,
			pathMappings = {
				["/supermetrics/www/superapi"] = "/Users/kendaganio/PhpStormProjects/superapi",
			},
		},
	}

	dapui.setup()
end

return { setup = setup }
