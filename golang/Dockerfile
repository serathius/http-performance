FROM golang:1.9.0-alpine3.6
RUN apk --no-cache add git
RUN go get -u github.com/valyala/fasthttp
WORKDIR /go/src/
COPY . .
RUN go install net_http
RUN go install fasthttp
