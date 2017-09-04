package main

import (
    "fmt"
    "github.com/valyala/fasthttp"
)


func fastHTTPHandler(ctx *fasthttp.RequestCtx) {
	fmt.Fprintf(ctx, "Hi there! RequestURI is %q", ctx.RequestURI())
}

func main() {
    fasthttp.ListenAndServe(":8000", fastHTTPHandler)
}



