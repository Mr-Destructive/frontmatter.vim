## Front-matter.vim

A simple plugin for writing the front-matter for a given SSG generator name. 

1. Add the [frontmatter plugin](https://github.com/Mr-Destructive/frontmatter.vim) to your preferred plugin manager's plugins list.
2. Add a key-map that maps to `call Frontmatter()`.
3. Write the SSG(static site generator) name for example `jekyll`.
4. Visually select it and press escape.
5. Press that key map and at the top, the front-matter will be generated with a few keys.

### Example:

```vimscript
nnoremap <leader>fm :call Frontmatter()<cr>
```

### Features:

- Supports SSGs like
  - jekyll
  - Markata
  - Hugo
  - Hexo
  - Gatsby
- Automatically sets current date.

