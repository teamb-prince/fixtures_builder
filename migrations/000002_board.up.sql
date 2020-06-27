
CREATE TABLE board
(
    id         UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    user_id TEXT references user_account(id),
    name TEXT NOT NULL,
    topic_id UUID references topic(id),
    description TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE
)
