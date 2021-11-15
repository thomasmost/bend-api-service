#[macro_use]
extern crate rocket;
#[macro_use]
extern crate diesel;
extern crate dotenv;

mod catchers;
mod db;
mod routes;
mod org;
mod schema;
use catchers::{internal_error};
use routes::{index, info, model_list};

#[launch]
fn rocket() -> _ {
    rocket::build()
    .register("/", catchers![internal_error])
    .mount("/", routes![index])
    .mount("/v0", routes![info, model_list])
}
