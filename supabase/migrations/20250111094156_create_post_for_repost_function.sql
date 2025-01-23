CREATE OR REPLACE FUNCTION create_post_for_repost(
    post_user_id UUID,
    timeline_type TIMELINE_TYPE,
    target_post_id BIGINT
)
    RETURNS BIGINT AS
$$
DECLARE
    post_id      BIGINT := generate_snowflake_id();
    follow_count INT;
BEGIN
    BEGIN
        -- 投稿を作成
        INSERT INTO t_posts (id, user_id, post_id) VALUES (post_id, post_user_id, target_post_id);
        -- 自分のタイムラインに投稿を追加
        INSERT INTO t_user_timelines (user_id, type, post_id) VALUES (post_user_id, timeline_type, post_id);
        -- フォロワーのタイムラインにも投稿を追加
        SELECT COUNT(*) FROM t_user_follows WHERE follow_user_id = post_user_id INTO follow_count;
        IF follow_count > 0 THEN
            INSERT INTO t_user_timelines (user_id, type, post_id)
            SELECT user_id, timeline_type, post_id
            FROM t_user_follows
            WHERE follow_user_id = post_user_id;
        END IF;
        RETURN post_id;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE;
    END;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION create_post_for_repost IS 'リポスト投稿作成';
