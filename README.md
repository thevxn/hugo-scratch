# hugo-scratch

[short article on this repo](https://krusty.space/projects/defekt-jadra/)

```shell
# clone/fork/pull the repo with hugo submodule
git pull ssh://git@github.com/savla-dev/hugo-scratch --recurse-submodules

# build the hugo binary inside docker (hugo-binary image)
make build

# edit dot-env file for site name
vi .env

# initialize that new site
make init

# import theme
#git submodule add [URL] [site_name]/themes/[theme]
git submodule add https://github.com/calintat/minimal.git change-me/themes/minimal

# start editing/writing your page(s) inside [site] directory; enforce https
# run the 'hugo server --bind 0.0.0.0 --port 443 --baseURL https://change-me.domain.tld' command to seamlessly edit your data
make serve
```
