use rocket::response::content;
use rocket::serde::json::{Value, json};

use crate::org;

#[get("/")]
pub fn index() -> &'static str {
    "OK"
}

#[get("/info")]
pub fn info() -> content::Json<String> {
    let version = env!("CARGO_PKG_VERSION");
    let content = format!("{{ service_name: 'api-service', service_version: '{}' }}", version);
    content::Json(content)
}

#[get("/model_list")]
pub fn model_list() -> content::Json<String> {
    let count = org::Org::count();
    let content = format!("{{ count: {} }}", count);
    content::Json(content)
}

#[get("/orgs")]
pub fn orgs() -> Value {
    let orgs = org::Org::read();
    json!(orgs)
}
