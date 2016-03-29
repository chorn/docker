# alpine-etherpad-sqlite

Alpine Linux with etherpad-lite using a sqlite database.

By default, these extra plugins are installed:
* ep_adminpads
* ep_authorship_toggle
* ep_delete_empty_pads
* ep_font_family
* ep_headings2
* ep_markdown
* ep_resizable_bars
* ep_syntaxhighlighting

## Usage

```
docker pull chorn/alpine-etherpad-sqlite
```

To run the container with etherpad running on port 9001:

```
$ docker run -d -p 9001:9001 -e ADMIN_USER=admin -e ADMIN_PASS=myadminpassword --restart=on-failure:10 --name etherpad chorn/alpine-etherpad-sqlite
```


## Reference

1. [Alpine Linux](http://alpinelinux.org)
2. [Etherpad](http://etherpad.org/)
3. [Etherpad source](https://github.com/ether/etherpad-lite)

