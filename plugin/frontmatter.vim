function! Frontmatter()

    normal gv"xy
    let context = getreg("x")
    let br = "\<esc>o"
    let nbr = "\<esc>"
    echom context
    if context == 'markata'
        execute "normal! ggO---".br."templateKey: blog-post".br."title:".br."description:".nbr.":pu=strftime('date: %F %T')".br."status: ".br."slug: ".br."tags: []".br."---".nbr."3G$"
    elseif context == 'jekyll'
        execute "normal! ggO---".br."layout: post".br."title:".br."subtitle:".nbr.":pu=strftime('date: %F %T')".br."categories: ".br."---".nbr."3G$"
    elseif context == 'hugo'
        execute "normal! ggO---".br."title:".br."summary:".nbr.":pu=strftime('date: %F %T')".br."draft: ".br."categories: ".br."---".nbr."2G$"
    elseif context == 'gatsby'
        execute "normal! ggO---".br."templateKey: page".br."title:".br."description: ".nbr.":pu=strftime('date: %F %T')".br."published: ".br."category: ".br."---".nbr."3G$"
    elseif context == 'hexo'
        execute "normal! ggO---".br."title:".br."excerpt: ".nbr.":pu=strftime('date: %F %T')".br."tags: []".br."---".nbr."2G$"
    endif

endfunction
