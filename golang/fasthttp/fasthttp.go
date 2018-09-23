package main

import (
    "fmt"
    "github.com/valyala/fasthttp"
)


func fastHTTPHandler(ctx *fasthttp.RequestCtx) {
	fmt.Fprintf(ctx, "Hello, World!")
}

func main() {
    fasthttp.ListenAndServe(":8000", fastHTTPHandler)
}



