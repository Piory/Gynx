-- Create table
CREATE TABLE t_users
(
    id         UUID        NOT NULL REFERENCES auth.users,
    gynx_id    VARCHAR(16) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    deleted_at TIMESTAMPTZ,
    PRIMARY KEY (id)
);
-- Add comment
COMMENT ON TABLE t_users IS 'ユーザーテーブル';
COMMENT ON COLUMN t_users.id IS 'ユーザーID';
COMMENT ON COLUMN t_users.gynx_id IS 'Gynx ID';
COMMENT ON COLUMN t_users.created_at IS '作成日時';
COMMENT ON COLUMN t_users.updated_at IS '更新日時';
COMMENT ON COLUMN t_users.deleted_at IS '削除日時';

-- Add row level security
ALTER TABLE t_users
    ENABLE ROW LEVEL SECURITY;
-- Add row level security policy for insert
CREATE POLICY "Users can create a t_users."
    ON t_users FOR INSERT
    TO authenticated
    WITH CHECK (
        (SELECT auth.uid()) = id
    );
-- Add row level security policy for update
CREATE POLICY "Users can update their own t_users."
    ON t_users FOR UPDATE
    TO authenticated
    USING (
    auth.uid() = id
    )
    WITH CHECK (
    (SELECT auth.uid()) = id AND
    (SELECT auth.jwt() ->> 'is_anonymous')::boolean = false
    );
-- Add row level security policy for select
CREATE POLICY "Public t_users are viewable only by authenticated users"
    ON t_users FOR SELECT
    TO authenticated
    USING (
        (SELECT auth.jwt() ->> 'is_anonymous')::boolean = false
    );