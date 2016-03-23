#!/bin/sh

[ -z ETHERPAD_TITLE ] && ETHERPAD_TITLE="Etherpad"
[ -z ADMIN_USER     ] && ADMIN_USER="admin"
[ -z ADMIN_PASS     ] && ADMIN_PASS="adminpassword"

sed -i -e "s/ETHERPAD_TITLE/${ETHERPAD_TITLE}/" -e "s/ADMIN_USER/${ADMIN_USER}/" -e "s/ADMIN_PASS/${ADMIN_PASS}/" settings.json

/app/node_modules/ep_etherpad-lite/node/server.js

