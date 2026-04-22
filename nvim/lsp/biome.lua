return {
    cmd = function(dispatchers, config)
        local cmd = 'biome'
        local local_cmd = (config or {}).root_dir and config.root_dir .. '/node_modules/.bin/biome'
        if local_cmd and vim.fn.executable(local_cmd) == 1 then
            cmd = local_cmd
        end
        return vim.lsp.rpc.start({ cmd, 'lsp-proxy' }, dispatchers)
    end,
    filetypes = {
        'astro',
        'css',
        'graphql',
        'html',
        'javascript',
        'javascriptreact',
        'json',
        'jsonc',
        'svelte',
        'typescript',
        'typescript.tsx',
        'typescriptreact',
        'vue',
    },
    workspace_required = true,
    root_dir = function(bufnr, on_dir)
        local project_root_markers = {
            'package-lock.json',
            'yarn.lock',
            'pnpm-lock.yaml',
            'bun.lockb',
            'bun.lock',
        }
        local project_root = vim.fs.root(bufnr, project_root_markers)
        if not project_root then
            return nil
        end

        local filename = vim.api.nvim_buf_get_name(bufnr)
        local biome_config_files = { 'biome.json', 'biome.jsonc' }

        --#region section taken from lspconfig.utils
        local field = 'biome'
        local path = vim.fn.fnamemodify(filename, ':h')
        local found = vim.fs.find(
            { 'package.json', 'package.json5' },
            { path = path, upward = true, type = 'file' }
        )

        for _, f in ipairs(found or {}) do
            -- Match the given `field`.
            local file = assert(io.open(f, 'r'))
            for line in file:lines() do
                if line:find(field) then
                    biome_config_files[#biome_config_files + 1] = vim.fs.basename(f)
                    break
                end
            end
            file:close()
        end
        --#endregion

        local is_buffer_using_biome = vim.fs.find(biome_config_files, {
            path = filename,
            type = 'file',
            limit = 1,
            upward = true,
            stop = vim.fs.dirname(project_root),
        })[1]
        if not is_buffer_using_biome then
            return nil
        end

        on_dir(project_root)
    end,
    single_file_support = true,
}
