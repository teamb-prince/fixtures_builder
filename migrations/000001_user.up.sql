CREATE TABLE user_account
(
    id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    role TEXT,
    profile_image TEXT,
    description TEXT,
    location TEXT,
    web TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE
);