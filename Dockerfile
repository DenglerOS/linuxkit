ARG     GOBUILD_IMAGE=golang:alpine
ARG     BASE_IMAGE=alpine:latest

FROM    $GOBUILD_IMAGE AS gobuild

RUN     apk --update --no-cache add \
        build-base \
        git

RUN     go get github.com/linuxkit/linuxkit/src/cmd/linuxkit

RUN     strip /go/bin/linuxkit


FROM    $BASE_IMAGE

RUN     apk --update --no-cache add \
        ca-certificates \
        git

COPY    --from=gobuild /go/bin/linuxkit /usr/bin/

ENTRYPOINT      [ "/usr/bin/linuxkit" ]
