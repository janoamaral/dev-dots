local function map(mode, lhs, rhs, desc, opts)
    local options = { noremap = true, desc = desc }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- La tecla coma como lider
vim.g.mapleader = " "
vim.api.nvim_set_keymap(
    "n",
    "<leader><space>",
    "",
    { noremap = true, silent = true }
)


-- =======================
-- Accesos rápidos
-- =======================

-- Búsqueda rápida
--
map("n", "~", "<cmd>HopWordCurrentLine<CR>")
map("n", "<leader><leader>", "<cmd>HopWord<CR>")

map("v", ",<leader>", "<cmd>lua require('scripts/selection').selection()<CR>")

map("n", ",c", ":")
map("n", "=", "<cmd>lua vim.lsp.buf.definition()<cr>")

-- Quitar el resaltado de busqueda
map("n", "<leader>d", "<cmd>noh<CR>")

-- => BUFFERS AND WINDOWS
-- Movimientos con leader
map("n", "<leader>t", " <C-w>j")
map("n", "<leader>r", " <C-w>h")
map("n", "<leader>n", " <C-w>k")
map("n", "<leader>s", " <C-w>l")

-- Splits
map("n", "<leader>vv", "<C-w>v")
map("n", "<leader>v<space>", "<C-w>s")

-- Cerrar pero mantener el buffer
map("n", "<leader>cc", "ZZ")
-- Cerrar el buffer
map("n", "<leader>cq", "<cmd>bdelete<CR>")
-- Cerrar todo
map("n", "<leader>c.", "<cmd>qa<CR>")

-- Crear nueva pestaña
map("n", ",t", "<cmd>tabnew<CR>")

-- Cerrar el buffer previo y abrir el anterior
map("n", "<leader>q", "<cmd>bp <BAR> bd #<CR>")

-- Maximiza el split actual
--nmap <leader>z :res<CR>:vertical res<CR>
map("n", ",m", "<cmd>ZenMode<cr>")

map("n", "zr", "<cmd>foldclose<CR>")

-- Close fold via visual selection
map("v", "zc", "<cmd>foldclose<CR>")

-- Seleccionar todo
map("n", "<C-a>", "ggVG")

--
-- => GUARDADO
--
-- Quick save and send an notification message with a diskette icon
map("n", ",,", '<cmd>silent update<bar>echo "󰆓 saved!"<CR>')
map(
    "n",
    "<backspace><backspace>",
    '<cmd>silent update<bar>echo "󰆓 saved!"<CR>'
)

-- Quick save and send an notification message with a diskette icon
map("n", ",.", '<cmd>source %<bar>echo "󰑓 config reloaded!"<CR>')

-- Salvado y salida rapida con ,,
map("n", ",f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")

-- VARIOS
-- Duplicar linea
map("n", "<C-D>", "yyp")

-- Abrir el explorador de archivos
-- map("n", "<leader>i", "<cmd>Oil --float<CR>")
map("n", "<leader>ii", "<cmd>Neotree filesystem focus left<CR>")
map("n", "<leader>iq", "<cmd>Neotree filesystem close<CR>")

-- Buscar en los buffers
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')

-- Buscar en los archivos
map(
    "n",
    "<leader><backspace>",
    '<cmd>lua require("telescope.builtin").find_files()<cr>'
)

-- Buscar en los archivos
map(
    "n",
    "<leader><del>",
    '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>'
)

-- Buscar en los archivos
map(
    "n",
    "<leader><tab>",
    '<cmd>lua require("telescope.builtin").live_grep()<cr>'
)

-- Buscar en los marks
map("n", "<leader>mm", '<cmd>lua require("telescope.builtin").marks()<cr>')

-- Buscar proyects
map("n", "<leader>p", "<cmd>Telescope projects<cr>")

-- Buscar funciones
map("n", "<leader>f", "<cmd>Telescope aerial<cr>")

-- Operaciones con GIT
map(
    "n",
    "<leader>gb",
    '<cmd>Gitsigns toggle_current_line_blame<CR>',
    "Toggle git blame"
)
map(
    "n",
    "<leader>gd",
    '<cmd>Gitsigns toggle_word_diff<CR>',
    "Toggle git diff"
)
--map('n', '<leader>gh', '<cmd>diffget //3<CR>')
--map('n', '<leader>gu', '<cmd>diffget //2<CR>')
-- map("n", "<leader>gl", "<cmd>silent LazyGit<CR>")
-- map("n", "<leader>ga", "<cmd>silent G add .<CR>")
-- map(
--   "n",
--   "<leader>gb",
--   '<cmd>silent lua require("telescope.builtin").git_branches()<cr>'
-- )
-- map(
--   "n",
--   "<leader>gp",
--   '<cmd>echo "Pushing..."<bar>silent G push <bar>echo " "<bar>!notify-send -i "/home/logico/.icons/BigSur-Originals/apps/scalable/github-desktop.svg" "Neovim" "Branch pushed to GitHub"<CR>'
-- )
-- map("n", "<leader>gg", "<cmd>silent G commit -a <CR>")
map("n", "<leader>gpr", "<cmd>silent !gh pr create --web<CR>")
--map("n", "<leader>gdd", "<cmd>DiffviewOpen<CR>")
--map("n", "<leader>gdc", "<cmd>DiffviewClose<CR>")
--map("n", "<leader>gdh", "<cmd>DiffviewFileHistory<CR>")
map(
    "n",
    "<leader>gs",
    '<cmd>execute "silent !gh browse " . @% . ":" . line(".")<CR>'
)

-- Arpoon files
map("n", "<backspace>a", '<cmd>lua require("harpoon"):list():add()<cr>')
map(
    "n",
    "<backspace><leader>",
    '<cmd>lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<cr>'
)

map("n", "<backspace>r", '<cmd>lua require("harpoon"):list():select(1)<cr>')
map("n", "<backspace>t", '<cmd>lua require("harpoon"):list():select(2)<cr>')
map("n", "<backspace>n", '<cmd>lua require("harpoon"):list():select(3)<cr>')
map("n", "<backspace>s", '<cmd>lua require("harpoon"):list():select(4)<cr>')

map("n", "<leader>C-n", '<cmd>lua require("harpoon"):list():prev()<cr>')
map("n", "<leader>C-t", '<cmd>lua require("harpoon"):list():next()<cr>')

-- Refactoring
map("x", "<leader>cre", "<cmd>Refactor extract ")
map("x", "<leader>crv", "<cmd>Refactor extract_var ")
map("x", "<leader>cri", "<cmd>Refactor inline_var")
map("n", "<leader>cri", "<cmd>Refactor inline_var")
map("n", "<leader>crb", "<cmd>Refactor extract_block<CR>")
map("n", "<leader>crr", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- Code actions
map(
    "n",
    "<leader>ca",
    '<cmd>lua vim.lsp.buf.code_action() require("pretty_hover").hover()<cr>'
)
map("n", "<leader>cf", "<cmd>AerialToggle<cr>", "Toogle Aerial")
map("n", "<leader>cq", '<cmd>lua require("telescope.builtin").quickfix()<cr>')
map(
    "n",
    "<leader>cx",
    '<cmd>lua require("telescope.builtin").quickfixhistory()<cr>'
)
map(
    "n",
    "<leader>ci",
    '<cmd>lua vim.lsp.buf.hover() require("pretty_hover").hover()<CR>',
    "Show code info"
)
map(
    "n",
    "<leader>cd",
    "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>",
    "Toggle diagnostics"
)
map(
    "n",
    "<leader>ce",
    '<cmd>lua vim.diagnostic.open_float() require("pretty_hover").hover()<CR>'
)
map(
    "n",
    "<leader>ck",
    '<cmd>lua vim.lsp.buf.signature_help() require("pretty_hover").hover()<CR>',
    "Function signature"
)
-- map("n", "<leader>cp", "<cmd>ColorizerToggle<CR>")

-- buscar seleccion en la web
map("x", "f", "<cmd>call SearchSelection()<CR>")

-- snippets movements
map("i", "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>")
map("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>")

map("n", "<C-f>", "/")

--map("v", "au", "<cmd>lua aiSearch()<CR>", "AI Review")
map("v", "au", "<cmd>PseudoCoderTranslate<CR>", "AI translate")

-- smart semicolon
map("n", ";", "mmA;<Esc>`m", "Smart semicolon")

-- Delete word with ctrl + backspace
map("i", "<C-H>", "<C-w>", "Delete word")
map("n", "<C-H>", "daw", "word")

-- DEBUGGING
map("n", "<F9>", "<cmd>DapToggleBreakpoint<CR>", "Toggle breakpoint")
map("n", "<F4>", "<cmd>DapStepOut<CR>", "Step out")
map("n", "<F5>", "<cmd>DapStepOver<CR>", "Step over")
map("n", "<F6>", "<cmd>DapStepInto<CR>", "Step into")

map(
    "n",
    "<F2>",
    "<cmd>lua require('dap-go').debug_test()<CR>",
    "Start/Continue debugging"
)
map("n", "<F10>", "<cmd>DapTerminate<CR>", "Stop debugging")
map("n", "<F11>", "<cmd>DapContinue<CR>", "Start/Continue debugging")
