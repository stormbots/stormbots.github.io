+++
sidemenu = true
title = "Team Updates"

+++

<ul id="Posts">
{{ range .Site.Taxonomies.posts }}
  {{ range .Params.tags }}
    <li><a href="tags/{{ . | urlize }}">{{ . }}</a> </li>
  {{ end }}
{{ end }}
</ul>
