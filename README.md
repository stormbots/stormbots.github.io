# Website Deployment status: 

### Site Build Status
[![wercker status](https://app.wercker.com/status/2cdeda6ada12d1bce00f402ba7207ca4/s/master "wercker status")](https://app.wercker.com/project/bykey/2cdeda6ada12d1bce00f402ba7207ca4) 

[![wercker status](https://app.wercker.com/status/2cdeda6ada12d1bce00f402ba7207ca4/m/master "wercker status")](https://app.wercker.com/project/bykey/2cdeda6ada12d1bce00f402ba7207ca4)

# Creating new posts
Creating new posts is very simple! It just consists of creating a text file in `content/posts/`. 

This does, however, require a few parameters on the top, in what's called the front-matter. The sample snippet we use is in `themes/stormbots/archtypes/default.md`. However, we can also create a blank one by using the tool `TODO: UPDATE THIS WHEN A TOOL IS MADE` in the topmost folder.

## Writing the post

The format we use is called "Markdown", which has a quick tutorial and cheat sheet here: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

This site generator also allows quick embedded snippets by using a `{{< snippet_type data-to-send-snippet >}}` format, called shortcodes 

There's a couple neat ones listed on the [docu page](https://gohugo.io/extras/shortcodes/), but here's the cool ones:

`{{< tweet 666616452582129664 >}}`

`{{< youtube w7Ft2ymGmfc >}}`

A stormbot-specific one is to insert a sponsor on the fly! We can do this by a sponsor short name, or all the sponsors of a certain level

`{{< partner vps >}}`

`{{< partner torrent >}}`

More of these can be tweaked and improved by modifying the templates, which is a more advanced process. 

## Adding Images and media

For video, you can copy-paste the embed link from below the video. You an optionally use the shortcode `{{< youtube w7Ft2ymGmfc >}}` (replacing the data part with your video) to embed it. Whatever's easier. 

For images, we need to copy the images to the right place.
- add the images to `/content/images/`. You likely want to create a dated folder to make the pictures easier to keep sorted.
- use the Markdown image code to add it. This will look like `![](/images/foldername/image-filename.jpg)`. Note, we don't use the `content` part; Our site's base is the 'content' folder. 
- Add a caption. `![image caption](/images/foldername/image-filename.jpg)`. This will add mouse-over text, and can be used for automatic captions when the layout is updated


## Previewing your changes
Run the *Hugo Server.bat* file in the root directory, then open up <http://localhost:1313>. You'll see the site, complete with all your new changes! Make sure everything looks right, and feel free to fiddle with the text to make it look right. 

If your post isn't showing up, or doesn't have the right tags, you probably need to adjust the front matter (the bit on the very top between `---` marks).

## Publishing the post:
Once the site looks good, let's push it live! 

Open up the Github application, and you'll see all the files you changed, added, or removed. By default, it should select all your changes, and you can then just type out a "commit message". This gets added to the log, so we can see what you've posted, along with a nice description. 

Once you've commited your changes, hit "sync" in the top corner. Your changes will be uploaded, and the site will be automatically updated on the remote server within a few minutes.

## Congratulations! 
And thanks for your hard work. :)




# Understanding the site structure
- *config.toml* : Sitewide configuration
- *content/posts* : Where the posts get stored
- *content/images* : 

For a detailed list, see <https://gohugo.io/overview/source-directory/>
- *static* : archetypes/
- *content/* : Where most things will go.
- *data/* : Contains data-only files that can be accessed by other pages
- *layouts/* : Templates to put content inside of. 
- *layouts/partial/* : snippets of a page, such as a header or footer, or special block
- *public/* : The output folder for a generated site. 
- *static/* : Files that won't be processed during the site build. These will retain the same paths, but be smushed in with the stuff from *content/*
- *themes/* : A place to write the basic source code of a page, and create small templates. Themes are simple to switch around.
- *themes/stormbots* : This is our site's theme folder. Everything to make our site run is in here. 
- *archtypes/* : "blank" files that can be used to easily create different content types. Using `hugo new video/buildupdate.md` will create a sample video post called `buildupdate.md` with the correct tags, current date, etc. This helps keep things consistent, and makes sure things aren't forgotten. 

One important note: This all exists in 2 places: Inside the current folder (you're looking at it!) and inside `theme/stormbots/`!


# Adjusting the theme
Feel like the site's not pretty enough?! Well, let's fix it. 

This is a whole different topic, so please open `themes/README.md` file for more information.
