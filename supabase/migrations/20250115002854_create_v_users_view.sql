CREATE VIEW v_users AS
SELECT up.user_id,
       u.gynx_id,
       up.username,
       up.avatar_url,
       u.created_at,
       u.updated_at
FROM public.t_users u
         LEFT JOIN public.t_user_profiles up ON u.id = up.user_id;

COMMENT ON VIEW v_users IS e'@graphql({"primary_key_columns": ["user_id"]})';
COMMENT ON COLUMN v_users.user_id IS 'ユーザーID';
COMMENT ON COLUMN v_users.gynx_id IS 'Gynx ID';
COMMENT ON COLUMN v_users.username IS 'ユーザー名';
COMMENT ON COLUMN v_users.avatar_url IS 'アバターURL';
COMMENT ON COLUMN v_users.created_at IS '作成日時';
COMMENT ON COLUMN v_users.updated_at IS '更新日時';
