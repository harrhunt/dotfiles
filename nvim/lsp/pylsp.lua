return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                black = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                -- linter options
                pylint = { enabled = false },

                ruff = { enabled = false },
                pyflakes = { enabled = false },

                pycodestyle = { enabled = false },
                -- type checker
                pylsp_mypy = {
                    enabled = true,
                    report_progress = true,
                    live_mode = false,
                },
                -- auto-completion options

                jedi_completion = { fuzzy = true },
                -- import sorting
                isort = { enabled = false },
            },
        },
    },
}
