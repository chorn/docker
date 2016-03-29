FROM mhart/alpine-node:0.12
MAINTAINER Chris Horn <chorn@chorn.com>

ENV ETHERPAD_VERSION=1.5.7 ETHERPAD_PLUGINS="ep_adminpads ep_authorship_toggle ep_delete_empty_pads ep_font_family ep_headings2 ep_markdown ep_resizable_bars ep_syntaxhighlighting"

WORKDIR /app
VOLUME /app/var

ADD entrypoint.sh entrypoint.sh
ADD settings.json var/settings.json

RUN apk add --quiet --update --no-cache curl
RUN curl -sSL https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.tar.gz | tar xz && rm -fr etherpad-lite-${ETHERPAD_VERSION}/var && mv etherpad-lite-${ETHERPAD_VERSION}/* .

RUN ln -s /app/var/settings.json /app/settings.json
RUN for f in "index" "pad" "timeslider" ; do cp "src/static/custom/js.template" "src/static/custom/$f.js" ; cp "src/static/custom/css.template" "src/static/custom/$f.css" ; done
RUN curl -sSlo src/static/js/jquery.js https://code.jquery.com/jquery-1.9.1.js

RUN mkdir node_modules && cd node_modules && ln -s ../src ep_etherpad-lite
RUN cd node_modules/ep_etherpad-lite && npm install --production
RUN npm install --production sqlite3 $ETHERPAD_PLUGINS

RUN apk del --quiet curl
RUN find /app /usr/lib/node_modules/ -type d -iname doc -or -iname docs -or -iname deb-src -or -iname tests -or -iname man -print0 | xargs -r -0 rm -fr
RUN find /tmp /root /etc/ssl /var/cache -type f -delete
RUN rm -fr etherpad-lite-${ETHERPAD_VERSION} /usr/include /usr/share/man /usr/lib/node_modules/npm/html

EXPOSE 9001
ENTRYPOINT ["./entrypoint.sh"]

