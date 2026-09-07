-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " => General
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
local o = vim.o
local wo = vim.wo

o.syntax = "on" -- Activar coloreo de sintaxis
o.showmode = false

-- Configuraciones generales
o.compatible = false

-- Deshacer permanente
o.undodir = "/home/logico/ramdisk/.undodir"
o.laststatus = 3 -- Enable global statusline
o.undofile = true
o.splitright = true
o.splitbelow = true
o.showmatch = true       -- Iluminar par de corchete cuando se posa en la pareja
o.mat = 4                -- Decimas de segundo que parpadea cuando se ilumina la pareja de corchetes
o.relativenumber = false -- Nuestra las lineas relativas a la posicion actual
o.scrolloff = 12         -- Empieza a hacer scroll cuando llega al limite de 8 líneas
o.ignorecase = true      -- Ignorar la capitalizacion
o.smartcase = true       -- Activar el smart case en la busqueda
o.incsearch = true       -- La busqueda se asemeja a los buscadores web
o.inccommand = "nosplit" -- Activar la busqueda incremental en los comandos
o.hlsearch = true        -- Resaltar los resultados de la busqueda
o.textwidth = 80         -- Corta la linea a las 83 columnas visualmente
o.colorcolumn = "80"     -- Marcar el limite en la columna 84
o.number = true          -- Activa el modo hibrido de numeracion de linea
o.wrap = false
o.showbreak = "↪"
o.linebreak = true
o.list = false
--o.formatoptions="-t"
o.encoding = "utf-8" -- Usar tabla de caracteres UTF-8
o.timeoutlen = 400
o.ttimeoutlen = 0    -- Acelerar keys
o.updatetime = 20
o.mouse = ""         -- Desactivar mouse

o.lazyredraw = false -- Activar el lazy redraw
o.ttyfast = true

o.backup = false   -- No archivo backup
o.swapfile = false -- No archivo swap
o.writebackup = false
o.autoread = true  -- Actualiza el contenido de un archivo abierto cuando hubo cambios en otro editor
o.path = "**"      -- Busca en los subdirectorios

--o.t_Co = "256"                      -- Usar la terminal con 256 colores
o.termguicolors = true      -- Usar la terminal con 256 colores

o.clipboard = "osc52" -- Soporta el portapapeles del sistema operativo

-- set iskeyword-=-_                  -- Sacar - y _ como parte de palabra
o.expandtab = true  -- Usar espacios en vez de tabs

o.shiftwidth = 4    -- Cada TAB inserta 4 espacios (estandar)
o.softtabstop = 4
o.smarttab = true   -- Tabs inteligentes
o.shiftround = true -- Siempre identa a un numero multiplo de shiftwidth
--
wo.foldlevel = 20
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = true

o.dictionary = "/usr/share/dict/words"
o.wildmenu = true -- Activar el Wild menu
-- set wildignore=*.o,*~,*.pyc,*.class
-- set wildignore+=**/node_modules/**
-- set wildignore+=**/_bower_components/**
-- set wildignore+=*.tmp
-- set wildignore+=**/vendor/**
-- set wildignore+=*.temp
o.shortmess = "atcF"

-- o.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,' -- Cursor titilando
o.cursorline = true -- Iluminar la linea
-- always show signcolumns
o.signcolumn = "yes"



vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
let g:closetag_filetypes = 'html,xhtml,jsx,javascript,javascriptreact,typescript.tsx'
]])


vim.diagnostic.config({
    virtual_text = { current_line = true },
})

--  COLORES OSCUROS
-- o.background = "dark"

-- Custom debug colors and signs
vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointCondition", {
    text = "",
    texthl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "DapBreakpoint",
})
vim.fn.sign_define("DapLogPoint", {
    text = "",
    texthl = "DapLogPoint",
})
vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "DapStopped",
    linehl = "DapStoppedLn",
})

vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#DB4B4B" })
vim.api.nvim_set_hl(
    0,
    "DapLogPoint",
    { ctermbg = 0, fg = "#61afef", bg = "#31353f" }
)
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#B0A305" })
vim.api.nvim_set_hl(0, "DapStoppedLn", { ctermbg = 0, bg = "#4B4C19" })

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '󰌶',
        },
    },
})


vim.g.loaded_netwr = 0
vim.g.loaded_netwrPlugin = 0
o.spellfile = "~/.config/nvim/spell/es.utf-8.add"
o.spelllang = "es"

