CREATE TABLE public.t_users
(
    id UUID NOT NULL DEFAULT gen_random_uuid(),
    auth_user_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    deleted_at TIMESTAMPTZ,
    PRIMARY KEY (id)
);
COMMENT ON TABLE public.t_users IS 'ユーザーテーブル';
COMMENT ON COLUMN public.t_users.id IS 'ユーザーID';
COMMENT ON COLUMN public.t_users.auth_user_id IS 'Authentication のユーザーID';
COMMENT ON COLUMN public.t_users.created_at IS '作成日時';
COMMENT ON COLUMN public.t_users.updated_at IS '更新日時';
COMMENT ON COLUMN public.t_users.deleted_at IS '削除日時';
