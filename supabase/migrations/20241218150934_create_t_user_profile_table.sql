CREATE TABLE t_user_profiles
(
    user_id           UUID         NOT NULL REFERENCES auth.users,
    username          VARCHAR(255) NOT NULL,
    avatar_url        VARCHAR(255),
    self_introduction TEXT,
    created_at        TIMESTAMPTZ  NOT NULL,
    updated_at        TIMESTAMPTZ  NOT NULL,
    deleted_at        TIMESTAMPTZ,
    PRIMARY KEY (user_id)
);
COMMENT ON TABLE t_user_profiles IS 'ユーザープロフィールテーブル';
COMMENT ON COLUMN t_user_profiles.user_id IS 'ユーザーID';
COMMENT ON COLUMN t_user_profiles.username IS 'ユーザー名';
COMMENT ON COLUMN t_user_profiles.avatar_url IS 'アバターURL';
COMMENT ON COLUMN t_user_profiles.created_at IS '作成日時';
COMMENT ON COLUMN t_user_profiles.updated_at IS '更新日時';
COMMENT ON COLUMN t_user_profiles.deleted_at IS '削除日時';

-- Add row level security
ALTER TABLE t_user_profiles
    ENABLE ROW LEVEL SECURITY;
-- Add row level security policy for insert
CREATE POLICY "Users can create a t_user_profiles."
    ON t_user_profiles FOR INSERT
    TO authenticated
    WITH CHECK (
    (SELECT auth.uid()) = user_id AND
    (SELECT auth.jwt() ->> 'is_anonymous')::boolean = false
    );
-- Add row level security policy for update
CREATE POLICY "Users can update their own t_user_profiles."
    ON t_user_profiles FOR UPDATE
    TO authenticated
    USING (
    auth.uid() = user_id
    )
    WITH CHECK (
    (SELECT auth.uid()) = user_id AND
    (SELECT auth.jwt() ->> 'is_anonymous')::boolean = false
    );
-- Add row level security policy for select
CREATE POLICY "Public t_users are viewable only by authenticated users"
    ON t_user_profiles FOR SELECT
    TO authenticated
    USING (
        (SELECT auth.jwt() ->> 'is_anonymous')::boolean = false
    )
