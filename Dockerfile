ARG     GOBUILD_IMAGE=golang:alpine
ARG     BASE_IMAGE=alpine:latest

FROM    $GOBUILD_IMAGE AS gobuild

RUN     apk --update --no-cache add \
	build-base \
        git
RUN     go install --buildmode pie --ldflags "-s -w -extldflags \"-static\"" github.com/linuxkit/linuxkit/src/cmd/linuxkit@latest 

RUN	ls -lh /go/bin/linuxkit

RUN	strip /go/bin/linuxkit

RUN	ldd /go/bin/linuxkit
RUN	ls -lh /go/bin/linuxkit


FROM    $BASE_IMAGE

RUN     apk --update --no-cache add git

COPY    --from=gobuild /go/bin/linuxkit /usr/bin/

ENTRYPOINT      [ "/usr/bin/linuxkit" ]
