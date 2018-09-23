#![deny(warnings)]
extern crate hyper;

use hyper::{Body, Request, Response, Server};
use hyper::rt::Future;
use hyper::service::service_fn_ok;

const PHRASE: &str = "Hello, World!";

fn hello_world(_req: Request<Body>) -> Response<Body> {
    Response::new(Body::from(PHRASE))
}


fn main() {
    let addr = ([127, 0, 0, 1], 8000).into();
    let new_svc = || {
        // service_fn_ok converts our function into a `Service`
        service_fn_ok(hello_world)
    };
    let server = Server::bind(&addr)
        .serve(new_svc)
        .map_err(|e| eprintln!("server error: {}", e));
    hyper::rt::run(server);
}