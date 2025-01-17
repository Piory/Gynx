CREATE VIEW v_posts AS
SELECT p1.id                                                              as post_id,
       p1.user_id,
       CASE
           WHEN p1.post_id IS NULL THEN
               NULL::JSONB
           ELSE
               (SELECT row_to_json(repost)::JSONB
                FROM (SELECT p2.id,
                             p2.user_id,
                             p2.text,
                             (SELECT jsonb_agg(jsonb_build_object(
                                     'id', pm.id,
                                     'post_id', pm.post_id,
                                     'display_order', pm.display_order,
                                     'type', pm.type,
                                     'url', pm.url,
                                     'created_at', pm.created_at,
                                     'updated_at', pm.updated_at,
                                     'deleted_at', pm.deleted_at
                                               ))
                              FROM t_post_medias pm
                              WHERE pm.post_id = p2.id)                                         AS medias,
                             (SELECT count(*) FROM t_posts WHERE post_id = p2.id)               AS repost_count,
                             (SELECT count(*) FROM t_user_post_favorites WHERE post_id = p2.id) AS favorite_count,
                             p2.created_at,
                             p2.updated_at,
                             p2.deleted_at
                      FROM t_posts p2
                               LEFT JOIN t_post_medias pm ON p2.id = pm.post_id
                      WHERE p2.id = p1.post_id
                      GROUP BY p2.id) repost)
           END
                                                                          AS repost,
       p1.text,
       CASE
           WHEN count(pm.id) = 0 THEN
               '[]'::JSONB
           ELSE
               jsonb_agg(jsonb_build_object(
                       'id', pm.id,
                       'post_id', pm.post_id,
                       'display_order', pm.display_order,
                       'type', pm.type,
                       'url', pm.url,
                       'created_at', pm.created_at,
                       'updated_at', pm.updated_at,
                       'deleted_at', pm.deleted_at
                         ))
           END                                                            AS medias,
       (SELECT count(*) FROM t_posts WHERE post_id = p1.id)               AS repost_count,
       (SELECT count(*) FROM t_user_post_favorites WHERE post_id = p1.id) AS favorite_count,
       p1.created_at,
       p1.updated_at,
       p1.deleted_at
FROM t_posts p1
         LEFT JOIN t_post_medias pm ON p1.id = pm.post_id
GROUP BY p1.id;

COMMENT ON VIEW v_posts IS e'@graphql({"primary_key_columns": ["post_id"]})';
COMMENT ON COLUMN v_posts.post_id IS '投稿ID';
COMMENT ON COLUMN v_posts.user_id IS 'ユーザーID';
COMMENT ON COLUMN v_posts.repost IS 'リポスト';
COMMENT ON COLUMN v_posts.text IS 'テキスト';
COMMENT ON COLUMN v_posts.medias IS 'メディア一覧';
COMMENT ON COLUMN v_posts.repost_count IS 'リポスト数';
COMMENT ON COLUMN v_posts.favorite_count IS 'お気に入り数';
COMMENT ON COLUMN v_posts.created_at IS '作成日時';
COMMENT ON COLUMN v_posts.updated_at IS '更新日時';
COMMENT ON COLUMN v_posts.deleted_at IS '削除日時';
