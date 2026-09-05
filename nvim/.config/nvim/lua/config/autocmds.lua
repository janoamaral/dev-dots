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

local autocmds = {
    default = {
        { "FileChangedShellPost", "*", "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded' | echohl None" }, -- Actualizar el contenido si hubo cambios
        { "BufRead,BufNewFile", "*.md,*.markdown,COMMIT_EDITMSG", "setlocal spell" }, -- Activar spellcheck sólo en archivos markdown y mensajes de commit
        { "BufWritePost", "~/dots/bspwm/bspwmrc",
            "silent exec" .. " \"!bspc wm -r;notify-send 'Neovim' 'bspwm reloaded'\" | redraw" }, -- Reiniciar bspwm
        { "BufWritePost", "~/dots/sxhkd/sxhkdrc",
            "silent exec" .. " \"!pkill -USR1 -x sxhkd;notify-send 'Neovim' 'sxhkd reloaded'\" | redraw" }, -- Reiniciar sxhkd
        { "BufWritePost", "~/dots/tmux/.tmux.conf",
            "silent exec" .. " \"!tmux source-file ~/.tmux.conf;tmux display-message '  Config reloaded...'\" | redraw" }, -- Reiniciar tmux
        { "BufWritePost", "~/dots/dunst/dunstrc",
            "silent exec" .. " \"!killall dunst;notify-send 'Neovim' 'Dunst reloaded'\" | redraw" }, -- Reiniciar Dunst
        { "BufWritePost", "~/dots/mako/config",
            "silent exec" .. " \"!killall mako;notify-send 'Neovim' 'Mako reloaded'\" | redraw" }, -- Reiniciar Mako
        { "BufWritePost", "~/dots/ghostty/config",
            "silent exec" .. " \"!systemctl reload --machine=logico@.host --user app-com.mitchellh.ghostty.service\" | redraw" }, -- Reiniciar Mako
        { "VimLeave", "*", "set guicursor=a:ver25"}, -- Reiniciar Mako
    },
}

nvim_create_augroups(autocmds)
