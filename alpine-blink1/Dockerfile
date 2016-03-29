FROM alpine:3.3

WORKDIR /usr/src

RUN apk add --update --quiet bash build-base libusb libusb-compat libusb-dev libusb-compat-dev git && git clone https://github.com/todbot/blink1.git && cd blink1/commandline/ && make OS=linux all blink1-tiny-server && make install && cp blink1-tiny-server /usr/local/bin/ && apk del --quiet build-base libusb-dev libusb-compat-dev git ncurses-libs ncurses-terminfo ncurses-terminfo-base readline bash apk-tools &&  rm -fr /usr/src/blink1 /var/cache/apk

EXPOSE 8080

ENTRYPOINT ["blink1-tiny-server",  "-p", "8080"]

