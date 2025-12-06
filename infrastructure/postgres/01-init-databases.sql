-- Initialize databases for all projects

-- Money Flows Project Database
CREATE DATABASE property_mgmt;

-- Create schemas within the money flows database
\c property_mgmt;

CREATE SCHEMA IF NOT EXISTS property_management;
CREATE SCHEMA IF NOT EXISTS home_accounts;

-- Grant permissions
GRANT ALL PRIVILEGES ON DATABASE property_mgmt TO postgres;
GRANT ALL PRIVILEGES ON SCHEMA property_management TO postgres;
GRANT ALL PRIVILEGES ON SCHEMA home_accounts TO postgres;

-- Future projects can add their databases here
-- Example:
-- CREATE DATABASE client_project_1;
-- CREATE DATABASE another_project;

-- Return to postgres database
\c postgres;

-- Log successful initialization
SELECT 'Databases initialized successfully!' AS status;
