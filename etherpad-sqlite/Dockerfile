FROM mhart/alpine-node:0.12
MAINTAINER Chris Horn <chorn@chorn.com>

ENV ETHERPAD_VERSION=1.5.7 ETHERPAD_PLUGINS="ep_adminpads ep_authorship_toggle ep_delete_empty_pads ep_font_family ep_headings2 ep_markdown ep_resizable_bars ep_syntaxhighlighting"

WORKDIR /app
VOLUME /app/var

# ADD https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.tar.gz etherpad-lite.tar.gz
ADD entrypoint.sh entrypoint.sh
ADD settings.json var/settings.json

RUN ln -s /app/var/settings.json /app/settings.json
RUN apk add --quiet --update --no-cache curl
RUN curl -sSL https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.tar.gz | tar xz
RUN rm -fr etherpad-lite-${ETHERPAD_VERSION}/var && mv etherpad-lite-${ETHERPAD_VERSION}/* .

RUN ./bin/installDeps.sh
RUN npm install sqlite3 $ETHERPAD_PLUGINS

RUN apk del --quiet curl
RUN find /app /usr/lib/node_modules/ -type d -iname doc -or -iname docs -or -iname deb-src -or -iname tests -or -iname man -print0 | xargs -r -0 rm -fr
RUN find /tmp /root /etc/ssl /var/cache -type f -delete
RUN rm -fr etherpad-lite-${ETHERPAD_VERSION} /usr/include /usr/share/man /usr/lib/node_modules/npm/html

EXPOSE 9001
ENTRYPOINT ["./entrypoint.sh"]

