function! Trim(string)
    return substitute(a:string, '\(^--\)\@<!\s*$//', '', '')
endfunction

function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunction

function! Frontmatter()

    normal gv"xy
    let context = getreg("x")
    let context = Chomp(context)
    let context = Trim(context)
    let context = tolower(context)
    let br = "\<esc>o"
    let nbr = "\<esc>"
    if context == 'markata'
		execute ":s/markata//"
        execute "normal! ggO---".br."templateKey: blog-post".br."title:".br."description:".nbr
		execute "normal! :pu=strftime('date: %F %T')".br."status: ".br."slug: ".br."tags: []".br."---".nbr."3G$"
    elseif context == 'jekyll'
		execute ":s/jekyll//"
        execute "normal! ggO---".br."layout: post".br."title:".br."subtitle:".nbr
		execute "normal! :pu=strftime('date: %F %T')".br."categories: ".br."---".nbr."3G$"
    elseif context == 'hugo'
		execute ":s/hugo//"
        execute "normal! ggO---".br."title:".br."summary:".nbr
		execute."normal! :pu=strftime('date: %F %T')".br."draft: ".br."categories: ".br."---".nbr."2G$"
    elseif context == 'gatsby'
		execute ":s/gatsby//"
        execute "normal! ggO---".br."templateKey: page".br."title:".br."description: ".nbr
		execute "normal! :pu=strftime('date: %F %T')".br."published: ".br."category: ".br."---".nbr."3G$"
    elseif context == 'hexo'
		execute ":s/hexo//"
        execute "normal! ggO---".br."title:".br."excerpt: ".nbr.":pu=strftime('date: %F %T')".nbr
		execute "nornal! otags: []".br."---".nbr."2G$"
    endif

endfunction
