-- Your SQL goes here
CREATE USER api_service WITH ENCRYPTED PASSWORD 'amalgam_serial_mysteries';
GRANT ALL PRIVILEGES ON DATABASE bend_db TO api_service;
ALTER DEFAULT PRIVILEGES GRANT ALL ON TABLES TO api_service;
ALTER DEFAULT PRIVILEGES GRANT ALL ON SEQUENCES TO api_service;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO api_service;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO api_service;