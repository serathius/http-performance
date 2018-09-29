#![feature(plugin, decl_macro)]
#![plugin(rocket_codegen)]

#[macro_use] extern crate rocket;

#[get("/")]
fn hello() -> String {
    format!("Hello, World!")
}

fn main() {
    rocket::ignite().mount("/", routes![hello]).launch();
}