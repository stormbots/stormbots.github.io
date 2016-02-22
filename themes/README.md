
# Adjusting the theme
The site generator we're using is Hugo. It's a somewhat complex build system, but once you get used to it it makes a lot of sense. Don't get frusturated! 

One of the good parts of this system is that you can actually look at the source and have meaningful information. This makes it simpler to debug than one might expect. 

## Breadcrumbs.
One of the hardest parts to get right off the bat is "What generates this file!?" So, throughout the theme if you look at the source you'll see things like `from="layouts/single"` on some elements. These were added to provide a tip on the flow the program is using. 

For example, <http://localhost:1313/posts/> page will show 
- `from=default/list` near the top/middle, and `from=default/summary` several other times on the posts.

# Understanding the build process

## Identify what type of file it is
This determines how it's rendered. The stuff in `/content/` typically has `type="post"` on the top, indicating it should be a "post". the file extension `.md` also indicates it will be processed with the Markdown engine, and converted to html. 

All "posts" will be generated through the first valid template. It will try to look for the `type`  specified (post in this case, and use a default as needed. There's two possibilities for this: 
- `theme/stormbots/post/single.html`
- `theme/stormbots/_default/single.html`

In our case, we provided one in `theme/stormbots/post/single.html`, which will serve as the outer-most template. 

Note, however, that if you open it, it contains several `partial` templates, such as `{{ partial "header.html" . }}`. This fetches a snippet from `theme/stormbots/layouts/partial/` with the matching name. 

When using partial templates the `.` on the end is used to pass variables to the template. This can be used to ensure any variables in the template match the page. `.` by itself means "the current context of the page", which means all variables currently able to be used by your template will be availible in the partial template. 


## Functions and variables






