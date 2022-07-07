## Front-matter.vim

A simple plugin for writing the front-matter for a given SSG generator name. 

1. Add the [frontmatter plugin](https://github.com/Mr-Destructive/frontmatter.vim) to your preferred plugin manager's plugins list.
2. Add a key-map that maps to `call Frontmatter()`.
3. Write the SSG(static site generator) name for example `jekyll`.
4. Visually select it and press escape.
5. Press that key map and at the top, the front-matter will be generated with a few keys.

### Example:

![Frontmatter Neovim Preview](https://res.cloudinary.com/techstructive-blog/image/upload/v1657116978/projects/markata-frontmatter_neovim.gif)

#### Vimscript 

```vimscript
nnoremap <leader>fm :call Frontmatter()<cr>
```

#### Lua

```lua
vim.keymap.set("n", "<leader>fm",  "<cmd>lua require('frontmatter').Frontmatter()<cr>")
```

### Features:

- Supports SSGs like
  - jekyll
  - Markata
  - Hugo
  - Hexo
  - Gatsby
- Automatically sets current date.

### Customization

The `Frontmatter` function can take in two parameters -> (`type_of_customization`, `{list of frontmatter}` )
1. Type of Customization -> `add` or `list` 
2.  List of Frontmatter -> A Lua table of strings representing the frontamtter keys

Add a custom keymap in your vimrc, init.vim or init.lua file.

- Add to an already existing frontmatter

  - Vim
  ```vimscript
  nnoremap <leader>fm :lua require('frontmatter').Frontmatter("add", {'series', 'image_url'})<CR>
  ```
  
  - Lua
  ```lua
  vim.keymap.set('n', '<leader>fm', "<cmd>lua require('frontmatter').Frontmatter('add',{'series', 'image_url'})<cr>")
  ```

- Create a new set of frontmatter

  - Vim
  ```vimscript
  nnoremap <leader>fm :lua require('frontmatter').Frontmatter("list", {'layout', 'status', 'series', 'series_description', 'image_url'})<CR>
  ```
  
  - Lua
  ```lua
  vim.keymap.set('n', '<leader>fm', "<cmd>lua require('frontmatter').Frontmatter('list',{'layout', 'status', 'series', 'image_url'})<cr>")
  ```

