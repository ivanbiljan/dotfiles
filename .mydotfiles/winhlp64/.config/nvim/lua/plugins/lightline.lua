-- lua/plugins/lightline.lua
-- Needs azure.vim at ~/.config/nvim/autoload/lightline/colorscheme/azure.vim
--
-- Per-redraw work: inline Vimscript expressions only (buffer-var / option reads).
-- Filetype icon: looked up once per buffer on FileType, stored in b:lightline_ft_icon.
-- Icon color: one highlight group, recolored when you enter a buffer/window.

local ICON_BG = "#2c2c2c" -- must match s:bg2 in azure.vim
local SECTION_HL = "LightlineRight_active_2" -- section that holds `filetype`

return {
  "itchyny/lightline.vim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.o.showmode = false
    vim.o.laststatus = 2

    local function apply_icon_hl()
      vim.api.nvim_set_hl(0, "LightlineFtIcon", {
        fg = vim.b.lightline_ft_color or "#a8a8a8",
        bg = ICON_BG,
      })
    end

    local group = vim.api.nvim_create_augroup("LightlineIcons", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local icon, color
        local ok, devicons = pcall(require, "nvim-web-devicons")
        if ok and ft ~= "" then
          icon, color = devicons.get_icon_color_by_filetype(ft, { default = true })
        end
        vim.b[args.buf].lightline_ft_icon = icon and (icon .. " ") or ""
        vim.b[args.buf].lightline_ft_color = color
        if args.buf == vim.api.nvim_get_current_buf() then
          apply_icon_hl()
        end
      end,
    })

    -- Only the active window shows the filetype, so one group is enough.
    -- ColorScheme is included because `:colorscheme` clears custom groups.
    vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "ColorScheme" }, {
      group = group,
      callback = apply_icon_hl,
    })

    -- Git branch: resolved asynchronously, cached in b:lightline_branch.
    -- No plugin needed; redraws only read the variable.
    local function update_branch(buf)
      if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].buftype ~= "" then
        return
      end
      local name = vim.api.nvim_buf_get_name(buf)
      local dir = name ~= "" and vim.fs.dirname(name) or vim.fn.getcwd()
      if vim.fn.isdirectory(dir) == 0 then
        return
      end
      vim.system({ "git", "-C", dir, "branch", "--show-current" }, { text = true }, function(res)
        local branch = res.code == 0 and vim.trim(res.stdout) or ""
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(buf) then
            vim.b[buf].lightline_branch = branch ~= "" and ("\u{e0a0} " .. branch) or ""
            vim.cmd.redrawstatus()
          end
        end)
      end)
    end

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePost" }, {
      group = group,
      callback = function(args)
        update_branch(args.buf)
      end,
    })

    -- Catch branch switches made outside Neovim (terminal, lazygit, ...)
    vim.api.nvim_create_autocmd({ "FocusGained", "DirChanged", "ShellCmdPost", "TermLeave" }, {
      group = group,
      callback = function()
        update_branch(vim.api.nvim_get_current_buf())
      end,
    })

    vim.g.lightline = {
      colorscheme = "azure",
      active = {
        left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } },
        right = { { "lineinfo" }, { "percent" }, { "fileencoding", "fileformat", "filetype" } },
      },
      component = {
        lineinfo = "%l:%v",
        gitbranch = "%{get(b:,'lightline_branch','')}",
        fileformat = "%{&ff==#'unix'?'\u{f17c}':&ff==#'dos'?'\u{e70f}':'\u{f179}'}",
        filetype = "%#LightlineFtIcon#%{get(b:,'lightline_ft_icon','')}"
          .. "%#" .. SECTION_HL .. "#%{&ft!=#''?&ft:'no ft'}",
      },
      component_visible_condition = {
        gitbranch = "get(b:,'lightline_branch','')!=#''",
      },
      separator = { left = "\u{e0b0}", right = "\u{e0b2}" },
      subseparator = { left = "\u{e0b1}", right = "\u{e0b3}" },
    }
  end,
}
