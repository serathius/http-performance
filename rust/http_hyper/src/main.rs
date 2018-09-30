#![deny(warnings)]
extern crate hyper;

use std::{thread, time};

use hyper::{Body, Method, Response, Server, StatusCode};
use hyper::rt::Future;
use hyper::service::service_fn_ok;

const PHRASE: &str = "Hello, World!";


fn main() {
    let addr = ([127, 0, 0, 1], 8000).into();
    let router = || {
        service_fn_ok(|req| {
            match(req.method(), req.uri().path()) {
                (&Method::GET, "/") => {
                    Response::new(Body::from(PHRASE))
                },
                (&Method::GET, "/work") => {
                    let stop = time::Instant::now() + time::Duration::from_micros(7500);
                    let mut result: i64 = 0;
                    while time::Instant::now() < stop {
                        for _ in 0..1000000000 {
                            result = result + 1;
                        }
                    }
                    Response::new(Body::from(""))
                },
                (&Method::GET, "/sleep") => {
                    let stop = time::Instant::now() + time::Duration::from_micros(7500);
                    while time::Instant::now() < stop {
                        thread::sleep(time::Duration::from_micros(500));
                    }
                    Response::new(Body::from(""))
                },
                (_, _) => {
                    let mut res = Response::new(Body::from("not found"));
                    *res.status_mut() = StatusCode::NOT_FOUND;
                    res
                }
            }
        })
    };
    let server = Server::bind(&addr)
        .serve(router)
        .map_err(|e| eprintln!("server error: {}", e));
    hyper::rt::run(server);
}