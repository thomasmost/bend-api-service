mod models;
mod schema;

pub fn list() {
    use schema::*;
    use models::*;

    let connection = establish_connection();
    let results = schema::org
        .limit(5)
        .load::<Org>(&connection)
        .expect("Error loading orgs");

    println!("Found {} orgs", results.len());
}