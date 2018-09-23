FROM golang:1.11.0
RUN apt-get update && apt-get install git
RUN go get -u github.com/valyala/fasthttp
WORKDIR /go/src/
COPY . .
RUN go install net_http
RUN go install fasthttp
