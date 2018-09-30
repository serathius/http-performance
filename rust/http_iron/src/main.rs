extern crate iron;

use iron::prelude::*;


fn hello_world(_: &mut Request) -> IronResult<Response> {
    Ok(Response::with((iron::status::Ok, "Hello World")))
}

fn main() {
    let chain = Chain::new(hello_world);
    Iron::new(chain).http("localhost:8000").unwrap();
}