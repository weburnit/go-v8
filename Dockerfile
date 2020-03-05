FROM weburnit/go-v8:0.0.2

RUN ls /go/src/github.com/weburnit/v8
ARG GO_DIR=/go/src/github.com/weburnit/go-v8/
ADD * $GO_DIR

# Install the go code and run tests.
ENV GO111MODULE=auto
WORKDIR $GO_DIR
RUN echo $GOPATH
RUN echo $GOROOT
RUN go mod vendor
RUN go test ./...