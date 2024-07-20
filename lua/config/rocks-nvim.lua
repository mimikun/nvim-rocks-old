do
    -- Specifies where to install/use rocks.nvim
    local install_location = vim.fs.joinpath(vim.fn.stdpath("data"), "rocks")

    -- Set up configuration options related to rocks.nvim (recommended to leave as default)
    local rocks_config = {
        rocks_path = vim.fs.normalize(install_location),
    }

    vim.g.rocks_nvim = rocks_config

    -- Configure the package path (so that plugin code can be found)
    local luarocks_path = {
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
    }
    package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

    -- Configure the C path (so that e.g. tree-sitter parsers can be found)
    local luarocks_cpath = {
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    }
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

    -- Load all installed plugins, including rocks.nvim itself
    vim.opt.runtimepath:append(
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*")
    )
end

-- If rocks.nvim is not installed then install it!
if not pcall(require, "rocks") then
    local rocks_location = vim.fs.joinpath(vim.fn.stdpath("cache"), "rocks.nvim")

    if not vim.uv.fs_stat(rocks_location) then
        -- Pull down rocks.nvim
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/nvim-neorocks/rocks.nvim",
            rocks_location,
        })
    end

    -- If the clone was successful then source the bootstrapping script
    assert(vim.v.shell_error == 0, "rocks.nvim installation failed. Try exiting and re-entering Neovim!")

    -- This script installs rocks.nvim through a bootstrapping process.
    -- The process consists of the following:
    -- - Configure luarocks to work flawlessly with Neovim
    -- - Install luarocks
    -- - Use the new luarocks installation to install `rocks.nvim`

    -- The rocks.nvim plugin is already loaded via the vim.opt.runtimepath:append()
    -- call in the `init.lua` bootstrapping script.

    math.randomseed(os.time())

    local config_data = vim.g.rocks_nvim or {}
    local install_path = config_data.rocks_path or vim.fs.joinpath(vim.fn.stdpath("data"), "rocks")
    local temp_luarocks_path = vim.fs.joinpath(vim.fn.stdpath("run"), ("luarocks-%X"):format(math.random(256 ^ 7)))
    local luarocks_binary = vim.fs.joinpath(temp_luarocks_path, "bin", "luarocks")

    ---@param dep string
    ---@return boolean is_missing
    local function guard_set_up_luarocks_dependency_missing(dep)
        if vim.fn.executable(dep) ~= 1 then
            vim.notify(dep .. " must be installed to set up luarocks.", vim.log.levels.ERROR)
            return true
        end
        return false
    end

    --- Notify command output.
    ---@param msg string
    ---@param sc vim.SystemCompleted
    ---@param level integer|nil
    local function notify_output(msg, sc, level)
        local function remove_shell_color(s)
            return tostring(s):gsub("\x1B%[[0-9;]+m", "")
        end
        vim.notify(
            table.concat({
                msg,
                sc and "stderr: " .. remove_shell_color(sc.stderr),
                sc and "stdout: " .. remove_shell_color(sc.stdout),
            }, "\n"),
            level
        )
    end

    --- Sets up luarocks for use with rocks.nvim
    ---@param path string
    ---@return boolean success
    local function set_up_luarocks(path)
        if guard_set_up_luarocks_dependency_missing("git") then
            return false
        end
        if guard_set_up_luarocks_dependency_missing("make") then
            return false
        end

        local tempdir = vim.fs.joinpath(vim.fn.stdpath("run"), ("luarocks-%X"):format(math.random(256 ^ 7)))

        vim.notify("Downloading luarocks...")

        local sc = vim.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/luarocks/luarocks.git",
            tempdir,
        }):wait()

        if sc.code ~= 0 then
            notify_output("Cloning luarocks failed: ", sc, vim.log.levels.ERROR)
            return false
        end

        vim.notify("Configuring luarocks...")

        sc = vim.system({
            "sh",
            "configure",
            "--prefix=" .. path,
            "--lua-version=5.1",
            "--force-config",
        }, {
            cwd = tempdir,
        }):wait()

        if sc.code ~= 0 then
            notify_output("Configuring luarocks failed.", sc, vim.log.levels.ERROR)
            return false
        end

        vim.notify("Installing luarocks...")

        sc = vim.system({
            "make",
            "install",
        }, {
            cwd = tempdir,
        }):wait()

        if sc.code ~= 0 then
            notify_output("Installing luarocks failed.", sc, vim.log.levels.ERROR)
            return false
        end

        return true
    end

    assert(set_up_luarocks(temp_luarocks_path), "failed to install luarocks! Please try again :)")

    vim.notify("Installing rocks.nvim...")

    local sc = vim.system({
        luarocks_binary,
        "--lua-version=5.1",
        "--tree=" .. install_path,
        "--server='https://nvim-neorocks.github.io/rocks-binaries/'",
        "install",
        "rocks.nvim",
    }):wait()

    if sc.code ~= 0 then
        notify_output("Installing rocks.nvim failed:", sc, vim.log.levels.ERROR)
        return
    end

    vim.print("rocks.nvim installed successfully!")

    vim.fn.delete(rocks_location, "rf")
end
