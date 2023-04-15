local autocmd = {}
local nvim_cmd = vim.api.nvim_command
local nvim_exec = vim.api.nvim_exec

function autocmd.setup()
  -- set tab display format ==> (moved to ide/indent.lua)
  nvim_cmd([[
    set listchars=tab:\|\ ,trail:▫
  ]])

  -- return to the previous edit position
  nvim_cmd(
    [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to the previous edit position
  ]]
  )

  nvim_exec(
    [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.md,*.json,*.go,*.lua,*.sh,*.js,*.ts,*.py,*.rb,*.hcl,*.tf FormatWrite
      autocmd BufNewFile,BufRead *.hcl set filetype=terraform syntax=terraform
    augroup END
  ]],
    true
  )

  -- enable comment string
  nvim_cmd([[
    autocmd FileType apache setlocal commentstring=#\ %s
  ]])

  -- TelescopePrompt setup
  vim.cmd(
    [[
    augroup cmp
      autocmd!
      autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
    augroup end
  ]]
  )

  -- set current working directory when opening vim
  vim.cmd([[
    augroup cdpwd
      autocmd!
      autocmd VimEnter * cd $PWD
    augroup end
  ]])
end

return autocmd
