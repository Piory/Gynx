CREATE EXTENSION IF NOT EXISTS citext;

-- Create table
CREATE TABLE t_users
(
    id         UUID        NOT NULL REFERENCES auth.users,
    gynx_id    CITEXT      NOT NULL UNIQUE,
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
-- Add row level security policy
CREATE POLICY "Allow users to access own user"
    ON t_users FOR ALL
    TO authenticated
    USING (
    auth.uid() = id
    )
    WITH CHECK (
    (SELECT auth.uid()) = id AND
    (SELECT auth.jwt() ->> 'is_anonymous')::boolean = false
    );

CREATE OR REPLACE FUNCTION handle_new_user() RETURNS TRIGGER AS
$$
DECLARE
    -- Gynx ID のデフォルト値
    default_gynx_id VARCHAR(16);
BEGIN
    -- Gynx ID のデフォルト値を設定
    SELECT left(md5(NEW.id::TEXT), 16) INTO default_gynx_id;
    -- ユーザー情報を登録
    INSERT INTO public.t_users(id, gynx_id, created_at, updated_at)
    VALUES (NEW.id, default_gynx_id, NEW.created_at, NEW.updated_at);
    -- 匿名ユーザーの場合はプロフィール登録をスキップ
    IF NEW.is_anonymous THEN
        RETURN NEW;
    END IF;
    -- ユーザープロフィールを登録
    INSERT INTO public.t_user_profiles(user_id, username, avatar_url, created_at, updated_at)
    VALUES (NEW.id, NEW.raw_user_meta_data ->> 'full_name', NEW.raw_user_meta_data ->> 'avatar_url', NEW.created_at,
            NEW.updated_at);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT
    ON auth.users
    FOR EACH ROW
EXECUTE PROCEDURE handle_new_user();


CREATE FUNCTION automatic_updating_updated_at()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER automatic_updating_updated_at
    BEFORE UPDATE
    ON t_users
    FOR EACH ROW
EXECUTE FUNCTION automatic_updating_updated_at();
