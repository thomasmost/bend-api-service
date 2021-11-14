use rocket::response::content;

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

#[get("/models")]
pub fn models() -> content::Json<&'static str> {
    // orgs::list()
    content::Json("{}")
}

