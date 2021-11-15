-- Your SQL goes here
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE orgs (
  id uuid DEFAULT uuid_generate_v1(),
  name VARCHAR NOT NULL,
  description TEXT NULL,
  stock_symbol VARCHAR NULL,
  twitter VARCHAR NULL,
  website VARCHAR NULL,
  created_at timestamp NOT NULL default current_timestamp,
  PRIMARY KEY (id)
)