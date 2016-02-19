 
# File Structure
- config.toml : Sitewide configuration


For a detailed list, see <https://gohugo.io/overview/source-directory/>
- *static* : archetypes/
- *content/* : Where most things will go.
- *data/* : Contains data-only files that can be accessed by other pages
- *layouts/* : Templates to put content inside of. 
- *layouts/partial/* : snippets of a page, such as a header or footer, or special block
- *public/* : The output folder for a generated site. 
- *static/* : Files that won't be processed during the site build. 
- *themes/* : A place to write the basic source code of a page, and create small templates. Themes are simple to switch around.
- *archtypes/* : "blank" files that can be used to easily create different content types. Using `hugo new video/buildupdate.md` will create a sample video post called `buildupdate.md` with the correct tags, current date, etc. This helps keep things consistent, and makes sure things aren't forgotten. 

One important note: This all exists in 2 places: Inside the current folder (you're looking at it!) and inside `theme/stormbots/`!

