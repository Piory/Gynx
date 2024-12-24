CREATE TABLE t_user_profiles
(
    user_id           UUID         NOT NULL REFERENCES t_users,
    username          VARCHAR(20)  NOT NULL,
    avatar_url        VARCHAR(255),
    self_introduction VARCHAR(160) NOT NULL DEFAULT '',
    created_at        TIMESTAMPTZ  NOT NULL,
    updated_at        TIMESTAMPTZ  NOT NULL,
    deleted_at        TIMESTAMPTZ,
    PRIMARY KEY (user_id)
);
COMMENT ON TABLE t_user_profiles IS 'ユーザープロフィールテーブル';
COMMENT ON COLUMN t_user_profiles.user_id IS 'ユーザーID';
COMMENT ON COLUMN t_user_profiles.username IS 'ユーザー名';
COMMENT ON COLUMN t_user_profiles.avatar_url IS 'アバターURL';
COMMENT ON COLUMN t_user_profiles.self_introduction IS '自己紹介';
COMMENT ON COLUMN t_user_profiles.created_at IS '作成日時';
COMMENT ON COLUMN t_user_profiles.updated_at IS '更新日時';
COMMENT ON COLUMN t_user_profiles.deleted_at IS '削除日時';

-- Add row level security
ALTER TABLE t_user_profiles
    ENABLE ROW LEVEL SECURITY;
-- Add row level security policy
CREATE POLICY "Allow users to access own user"
    ON t_user_profiles FOR ALL
    TO authenticated
    USING (
    auth.uid() = user_id
    )
    WITH CHECK (
    (SELECT auth.uid()) = user_id AND
    (SELECT auth.jwt() ->> 'is_anonymous')::boolean = false
    );

CREATE TRIGGER automatic_updating_updated_at
    BEFORE UPDATE
    ON t_user_profiles
    FOR EACH ROW
EXECUTE FUNCTION automatic_updating_updated_at();
