#[macro_use]
extern crate rocket;
extern crate diesel;
extern crate dotenv;

mod db;
mod routes;
// mod orgs;
use routes::{index, info, models};

#[launch]
fn rocket() -> _ {
    let pool = db::establish_connection();
    rocket::build()
    .mount("/", routes![index])
    .mount("/v0", routes![info, models])
}
