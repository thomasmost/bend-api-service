#[derive(Queryable)]
pub struct Org {
    pub id: Uuid,
    pub name: String,
    pub stock_symbol: Nullable<String>,
    pub twitter: Nullable<String>,
    pub website: Nullable<String>,
    pub description: Nullable<String>,
    pub created_at: Timestamp
}