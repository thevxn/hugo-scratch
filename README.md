# hugo-scratch

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
git submodule add https://github.com/calintat/minimal.git krusty-space/themes/minimal

# start editing/writing your page(s) inside [site] directory
# run the 'hugo server --bindo 0.0.0.0' command to seamlessly edit your data
make serve
```
