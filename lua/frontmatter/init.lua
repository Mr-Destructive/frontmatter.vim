local M = {}

-- get the seected text
-- type your SSG Name and Visual select it before calling the keymap
local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  -- only fetch the first line
  return vim.inspect(lines[1])
end

function M.Frontmatter()
  local selection = get_visual_selection()

  -- seected text is a valid supported SSG
  local valid_SSGs = {'"markata"', '"jekyll"', '"hugo"', '"gatsby"', '"hexo"'}
  local found = false
  for _, v in ipairs(valid_SSGs) do
    if v == selection then
      found = true
      break
    end
  end

  if found then
  -- adding frontmatter text 
    local frontmatter_text = {"---"}

    -- creating a table with specific element values to specific SSG
    if selection == '"markata"' then
      context = {"templateKey", "title", "description", "status", "tags"}
    elseif selection == '"jekyll"' then
      context = {"layout", "title", "subtitle", "draft", "categories"}
    elseif selection == '"gatsby"' then
      context = {"templateKey", "title", "description", "published", "category"}
    elseif selection == '"hugo"' then
      context = {"title", "summary", "draft", "categories"}
    elseif selection == '"hexo"' then
      context = {"title", "excerpt", "tags"}
    else
      context = {""}
    end
    for k, v in ipairs(context) do
      table.insert(frontmatter_text, v .. ":")
    end
    -- setting current date
    table.insert(frontmatter_text, "date: " .. os.date("%F %T"))
    table.insert(frontmatter_text, "---")

    -- deleting the current line -> SSG Name
    vim.api.nvim_del_current_line()

    -- append frontmatter to the first line
    vim.api.nvim_buf_set_lines(0, 0, 0, false, frontmatter_text)
  else
    print("SSG Selected is not supported")
  end
end
return M
