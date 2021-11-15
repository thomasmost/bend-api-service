-- Your SQL goes here

CREATE TABLE activities (
  id uuid DEFAULT uuid_generate_v1(),
  org_id uuid NOT NULL,
  activity_message VARCHAR NOT NULL,
  source_url VARCHAR NOT NULL,
  created_at timestamp NOT NULL default current_timestamp,
  PRIMARY KEY (id)
);

CREATE TABLE commitments (
  id uuid DEFAULT uuid_generate_v1(),
  org_id uuid NOT NULL,
  target_year smallint NULL,
  reduction_percentage smallint NULL,
  base_year smallint NULL,
  commitment_date date,
  commitment_url varchar,
  status varchar,
  created_at timestamp NOT NULL default current_timestamp,
  PRIMARY KEY (id)
);

CREATE TABLE performances (
  id uuid DEFAULT uuid_generate_v1(),
  org_id uuid NOT NULL,
  fy bigint,
  scope_1 bigint,
  scope_2 bigint,
  scope_3 bigint,
  offsets bigint,
  revenue_usd bigint,
  source_url varchar,
  created_at timestamp NOT NULL default current_timestamp,
  PRIMARY KEY (id)
);