function! Frontmatter()

inoremap :jekyll<c-y> <ESC>dd<ESC>:1<CR>O<ESC>i---<ESC>olayout: post<ESC>otitle : ""<ESC>osubtitle: ""<ESC>:r! date "+date: \%Y-\%m-\%d \%H:\%M:\%S" <ESC>ocategories: []<ESC>oimage: <ESC>o---<Esc>o<ESC>

inoremap :hugo<c-y> <ESC>dd<ESC>:1<CR>O<ESC>i---<ESC>otitle : ""<ESC>osummary: ""<ESC>:r! date "+date: \%Y-\%m-\%d \%H:\%M:\%S" <ESC>ocategories:<ESC>oimage_url: <ESC>o---<Esc>o<ESC>

inoremap :gatsby<c-y> <ESC>dd<ESC>:1<CR>O<ESC>i---<ESC>oslug: ""<ESC>otitle : ""<ESC>odescription: ""<ESC>:r! date "+date: \%Y-\%m-\%d \%H:\%M:\%S" <ESC>ocategories: []<ESC>oimage: <ESC>o---<Esc>o<ESC>

inoremap :hexo<c-y> <ESC>dd<ESC>:1<CR>O<ESC>i---<ESC>otitle : ""<ESC>oexcerpt: ""<ESC>:r! date "+date: \%Y-\%m-\%d \%H:\%M:\%S" <ESC>otags: []<ESC>o---<Esc>o<ESC>

inoremap :markata<c-y> <ESC>dd<ESC>:1<CR>O<ESC>i---<ESC>olayoutKey: blog-post<ESC>otitle : ""<ESC>osubtitle: ""<ESC>:r! date "+date: \%Y-\%m-\%d \%H:\%M:\%S" <ESC>otags: []<ESC>o---<Esc>o<ESC>

endfunction
