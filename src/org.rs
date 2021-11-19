use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;
use serde::{Serialize};

use uuid::Uuid;

use crate::db::establish_connection;
use crate::schema::orgs;

#[derive(AsChangeset, Queryable, Serialize)]
pub struct Org {
    pub id: Uuid,
    pub name: String,
    pub description: Option<String>,
    pub stock_symbol: Option<String>,
    pub twitter: Option<String>,
    pub website: Option<String>,
    pub created_at: std::time::SystemTime
}

#[derive(Insertable)]
#[table_name = "orgs"]
pub struct NewOrg {
    pub name: String,
    pub stock_symbol: String,
    pub twitter: String,
    pub website: String,
}

impl Org {
    pub fn create(organization: NewOrg, connection: &PgConnection) -> () {
        diesel::insert_into(orgs::table)
            .values(&organization)
            .execute(connection)
            .expect("Error creating new org");
    }

    pub fn read() -> Vec<Org> {
        let connection = establish_connection();
        orgs::table.load::<Org>(&connection).unwrap()
    }
    
    pub fn count() -> usize {
        let connection = establish_connection();
        let results = orgs::table
            .limit(5)
            .load::<Org>(&connection)
            .expect("Error loading orgs");
    
        println!("Found {} orgs", results.len());
        return results.len();
    }

    // pub fn delete(id: Uuid, connection: &PgConnection) -> bool {
    //     diesel::delete(orgs::table.find(id)).execute(connection).is_ok()
    // }
}