#[macro_use] extern crate rocket;

mod routes;
use routes::{info, models};

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/v0", routes![info, models])
}
