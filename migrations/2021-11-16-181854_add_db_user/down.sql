-- This file should undo anything in `up.sql`
REVOKE ALL PRIVILEGES ON DATABASE bend_db FROM api_service;
DROP USER api_service;