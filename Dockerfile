FROM golang:1 AS build-env

RUN go get github.com/governance-foundation/gdrive
WORKDIR /go/src/github.com/governance-foundation/gdrive
RUN CGO_ENABLED=0 go build

FROM alpine

LABEL   maintainer="devops <devops@governance.foundation>" \
        os="alpine" \
        container.description="google drive api" \
        version="1.0.0" \
        imagename="gdrive" \
        test.command="gdrive version" \
        test.command.verify="2.1.1"

COPY --from=build-env /go/src/github.com/governance-foundation/gdrive/gdrive /usr/local/bin/gdrive
ENTRYPOINT ["/usr/local/bin/gdrive"]