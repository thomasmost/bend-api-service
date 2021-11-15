table! {
    activities (id) {
        id -> Uuid,
        org_id -> Uuid,
        activity_message -> Varchar,
        source_url -> Varchar,
        created_at -> Timestamp,
    }
}

table! {
    commitments (id) {
        id -> Uuid,
        org_id -> Uuid,
        target_year -> Nullable<Int2>,
        reduction_percentage -> Nullable<Int2>,
        base_year -> Nullable<Int2>,
        commitment_date -> Nullable<Date>,
        commitment_url -> Nullable<Varchar>,
        status -> Nullable<Varchar>,
        created_at -> Timestamp,
    }
}

table! {
    orgs (id) {
        id -> Uuid,
        name -> Varchar,
        description -> Nullable<Text>,
        stock_symbol -> Nullable<Varchar>,
        twitter -> Nullable<Varchar>,
        website -> Nullable<Varchar>,
        created_at -> Timestamp,
    }
}

table! {
    performances (id) {
        id -> Uuid,
        org_id -> Uuid,
        fy -> Nullable<Int8>,
        scope_1 -> Nullable<Int8>,
        scope_2 -> Nullable<Int8>,
        scope_3 -> Nullable<Int8>,
        offsets -> Nullable<Int8>,
        revenue_usd -> Nullable<Int8>,
        source_url -> Nullable<Varchar>,
        created_at -> Timestamp,
    }
}

allow_tables_to_appear_in_same_query!(
    activities,
    commitments,
    orgs,
    performances,
);
