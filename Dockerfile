FROM weburnit/go-v8:0.0.2

ARG GO_DIR=/go/src/github.com/weburnit/gov8/
ADD * $GO_DIR
COPY example /go/src/github.com/weburnit/gov8/example
RUN ls -la $GO_DIR
# Install the go code and run tests.
ENV GO111MODULE=auto
WORKDIR $GO_DIR
RUN go get github.com/dop251/goja
RUN go get github.com/project-flogo/core
RUN go get github.com/dlclark/regexp2
RUN go get github.com/go-sourcemap/sourcemap
RUN go get go.uber.org/zap
RUN go get go.uber.org/atomic
RUN go get go.uber.org/multierr
RUN cd /go/src/github.com/weburnit/v8/ && go test ./...
RUN cd $GO_DIR && cd example && go run main.go