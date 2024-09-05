ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache ca-certificates

COPY --from=golang:1.23.0-alpine /usr/local/go/ /usr/local/go/

ENV GOTOOLCHAIN=local
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/$GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 1777 "$GOPATH"
WORKDIR $GOPATH

RUN go install github.com/bemasher/rtlamr@latest \
	&& go install github.com/bemasher/rtlamr-collect@latest

# RUN apk add --no-cache musl-dev gcc make cmake pkgconf git libusb-dev

RUN apk add --no-cache --virtual build-deps alpine-sdk cmake git go libc-dev libusb-dev; \
    git clone --single-branch git://git.osmocom.org/rtl-sdr.git /usr/local/rtl-sdr; \
    mkdir -vp /usr/local/rtl-sdr/build; \
    cd /usr/local/rtl-sdr/build; \
    cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr/local; \
    make; \
    make install; \
    apk del build-deps; \
    apk add --no-cache libusb

RUN echo "blacklist dvb_usb_rtl28xxu" >> /etc/modprobe.d/rtlsdr-blacklist.conf

ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

COPY rootfs /