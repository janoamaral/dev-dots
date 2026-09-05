local api = vim.api
local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup ' .. group_name)
        api.nvim_command('autocmd!')
        api.silent = true
        for _, def in ipairs(definition) do
            -- if type(def) == 'table' and type(def[#def]) == 'function' then
            -- 	def[#def] = lua_callback(def[#def])
            -- end
            local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [""] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    [""] = "SELECT BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color = "%#StatuslineModeNormal#"
    if current_mode == "n" then
        mode_color = "%#StatuslineModeNormal#"
    elseif current_mode == "i" or current_mode == "ic" then
        mode_color = "%#StatuslineModeInsert#"
    elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
        mode_color = "%#StatuslineModeVisual#"
    elseif current_mode == "R" or current_mode == "r" then
        mode_color = "%#StatuslineModeReplace#"
    elseif current_mode == "c" then
        mode_color = "%#StatuslineModeCommand#"
    elseif current_mode == "t" then
        mode_color = "%#StatuslineModeCommand#"
    end
    return mode_color
end

local function filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
    if fpath == "" or fpath == "." then
        return " "
    end

    return string.format(" %%<%s/", fpath)
end

local function lsp()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""

    if count["errors"] ~= 0 then
        errors = " %#DiagnosticVirtualLinesError#󰅚 " .. count["errors"]
    end
    if count["warnings"] ~= 0 then
        warnings = " %#DiagnosticVirtualLinesWarn#󰀪 " .. count["warnings"]
    end
    if count["hints"] ~= 0 then
        hints = " %#DiagnosticVirtualLinesHint#󰌶 " .. count["hints"]
    end
    if count["info"] ~= 0 then
        info = " %#DiagnosticVirtualLinesInfo#󰋽 " .. count["info"]
    end

    return errors .. warnings .. hints .. info .. " %#Normal#"
end

local function filetype()
    return string.format(" %s ", vim.bo.filetype):upper()
end

local function lsp_clients_icons()
    -- Use new active clients API
    local clients = vim.lsp.get_clients { bufnr = 0 }
    local icons = {
        ["pyright"] = " ",
        ["tsserver"] = " ",
        ["gopls"] = "󰟓 ",
        ["rust_analyzer"] = " ",
        ["lua_ls"] = " ",
        ["html"] = " ",
        ["cssls"] = " ",
        ["eslint"] = " ",
        ["bashls"] = " ",
    }
    local result = " "
    for _, client in pairs(clients) do
        if icons[client.name] then
            result = result .. icons[client.name]
        end
    end
    return result
end

local function copilot_attached()
    for _, client in pairs(vim.lsp.get_clients { bufnr = 0 }) do
        if client.name == "GitHub Copilot" then
            return "%#StatusLineInverse#%#NormalFloat#  "
        end
    end
    return "%#StatusLineInverse#%#NormalFloat#  "
end


local function lineinfo()
    if vim.bo.filetype == "alpha" then
        return ""
    end
    return " %P %l:%c %#StatusLineInverse#"
end

local function filename()
    local fname = vim.fn.expand "%:t"
    if fname == "" then
        return ""
    end
    return fname .. " "
end

Statusline = {}

Statusline.active = function()
    return table.concat {
        update_mode_colors(),
        mode(),
        "%#Normal#",
        " %m",
        filepath(),
        filename(),
        "%#Normal#",
        lsp(),
        "%=%#NormalFloat#",
        copilot_attached(),
        lsp_clients_icons(),
        filetype(),
        lineinfo(),
    }
end

function Statusline.inactive()
    return " %F"
end

function Statusline.short()
    return "%#StatusLineNC#   NvimTree"
end

local autocmds = {
    status = {
        { "WinEnter", "*", "setlocal statusline=%!v:lua.Statusline.active()" }, -- Actualizar el contenido si hubo cambios
        { "BufEnter", "*", "setlocal statusline=%!v:lua.Statusline.active()" }, -- Actualizar el contenido si hubo cambios
    },
}

vim.cmd([[
    hi StatusLine guibg=none guifg=#1d2022
    hi StatusLineInverse guibg=#15161E guifg=none
    hi StatuslineModeCommand guibg=#e0af68 guifg=#15161e,
    hi StatuslineModeInsert guibg=#9ece6a guifg=#15161e,
    hi StatuslineModeNormal guibg=#7aa2f7 guifg=#15161E,
    hi StatuslineModeOther guibg=#1abc9c guifg=#15161e,
    hi StatuslineModeReplace guibg=#f7768e guifg=#15161e,
    hi StatuslineModeVisual guibg=#bb9af7 guifg=#15161e,
    hi StatuslineDevinfo guibg=#3b4261 guifg=#15161e,
    hi StatuslineFileinfo guibg=#3b4261 guifg=#15161e,
    hi StatuslineFilename guibg=#292e42 guifg=#15161e,
    hi StatuslineInactive guibg=#16161e guifg=#7aa2f7,
    hi StatusLineExtra guibg=#3b4261 guifg=#7aa2f7,
]])

nvim_create_augroups(autocmds)
